using System.Collections.Generic;
using UnityEngine;
using Control;

public class GameManager : MonoBehaviour {


	public List<GameObject> Dates;
	public List<Transform> fileDattente;

	public Transform tableDate;
	public Transform outside;

	public int currentDateIndex = 0;

	public bool nik = false;

	private KEY _CurrentKey { get; set; }

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

		if (!GetComponent<ControlManager>())
		{
			gameObject.AddComponent<ControlManager>();
		}

		_CurrentKey = KEY.INVALID;
	}

	// Update is called once per frame
	void Update () {

		if (currentDateBehavior.destinationReached) 
		{
			//On tire une touche au hasard si besoin
			if (_CurrentKey == KEY.INVALID && !nik)
			{
				_CurrentKey = (KEY)Random.Range(0, System.Enum.GetValues(typeof(KEY)).Length - 1);
			}

			if (_CurrentKey != KEY.INVALID)
			{
				//Montrer l'input voulu
			}

			if (ControlManager.InputPressed)
			{
				// Pression sur la bonne touche
				if (ControlManager.IsKeyPressed(_CurrentKey))
				{
					_CurrentKey = KEY.INVALID;
				}
				// Pression sur une mauvaise touche
				else
				{
					_CurrentKey = KEY.INVALID;
					nik = true;
				}
			}

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
