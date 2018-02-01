﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class GameManager : MonoBehaviour {


	public List<GameObject> Dates;
	public List<Transform> fileDattente;

	public Transform tableDate;
	public Transform outside;

	public int currentDateIndex = 0;

	public bool nik = false;

//	public DatesBehavior currentDateBehavior;

	public DatesBehavior currentDateBehavior
	{  
		get
		{
			return Dates [currentDateIndex].GetComponent<DatesBehavior> ();
		}
	}

	// Use this for initialization
	void Start () {

		currentDateIndex = 0;	
		currentDateBehavior.setDestination (tableDate.position);
		//On fait avanceer la file d'attente
		for (int i = 0; i < fileDattente.Count; i++) 
		{
			DatesBehavior tmpDatesBehavior = Dates [(currentDateIndex + i + 1) % Dates.Count].GetComponent<DatesBehavior> ();
			tmpDatesBehavior.setDestination (fileDattente [i].position);
		}
	}

	// Update is called once per frame
	void Update () {

		if (currentDateBehavior.destinationReached) 
		{

			//On affiche des touche et on fait des trucs


			if (!nik) 
			{
				//OnContinue d'afficher les touches 

			}
			else 
			{
				//Il perd patience
				currentDateBehavior.patience--;

				if(currentDateBehavior.patience <= 0)
				{
					currentDateBehavior.setDestination (outside.position); // Il Sort //Le Date se suicide

					//On change de Date // Le Date n'est plus en place				
					currentDateIndex++;
					currentDateIndex %= Dates.Count;

					//Le Date suivant commence a bouger
					currentDateBehavior.setDestination(tableDate.position);


					//On fait avanceer la file d'attente
					for (int i = 0; i < fileDattente.Count; i++) 
					{
						DatesBehavior tmpDatesBehavior = Dates [(currentDateIndex + i + 1) % Dates.Count].GetComponent<DatesBehavior> ();
						tmpDatesBehavior.setDestination (fileDattente [i].position);
					}

					nik = false;
				}
			}
		}
	}		
}