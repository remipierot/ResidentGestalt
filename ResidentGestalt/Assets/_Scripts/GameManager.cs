using System.Collections.Generic;
using UnityEngine;
using Control;
using TMPro;

public class GameManager : MonoBehaviour {


	public List<GameObject> Dates;
	public List<Transform> fileDattente;

	public Transform tableDate;
	public Transform outside;

	public int currentDateIndex = 0;

	public bool nik = false;

	private KEY _CurrentKey { get; set; }

	public Timer main_timer;
	float time_max = 1000.0f;

	public TextMeshPro high_score_txt;
	public TextMeshPro score_txt;
	int score = 0;
	int high_score = 0;

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
		
		score_txt.text = "" + score;

		if (currentDateBehavior.destinationReached) 
		{
			//On tire une touche au hasard si besoin
			if (_CurrentKey == KEY.INVALID && !nik)
			{
				_CurrentKey = (KEY)Random.Range(0, System.Enum.GetValues(typeof(KEY)).Length - 1);
				main_timer.newEvent (time_max);
			}

			if (_CurrentKey != KEY.INVALID && !KeyDisplay.IsDisplayed)
			{
				KeyDisplay.RandomizePositionsAndShow(_CurrentKey);
			}

			if (ControlManager.InputPressed)
			{
				main_timer.pause ();
				// Pression sur la bonne touche
				if (ControlManager.IsKeyPressed(_CurrentKey))
				{
					score += (int)main_timer.time_left;
					_CurrentKey = KEY.INVALID;
				}
				// Pression sur une mauvaise touche
				else
				{
					_CurrentKey = KEY.INVALID;
					nik = true;
				}

				KeyDisplay.HideAll();
			} 
			else if (main_timer.oot) {
				nik = true;
				_CurrentKey = KEY.INVALID;
				KeyDisplay.HideAll();
			}

			if (!nik) 
			{
				// OnContinue d'afficher les touches 
			}
			else 
			{				
				if (score > high_score) {
					high_score = score;
					high_score_txt.text = "" + high_score;
				}
				score = 0;

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
