using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Timer : MonoBehaviour {

	public TextMeshPro timer_txt;
	public bool pause = false;
	int minutes = 0;
	int secondes = 0;

	// Use this for initialization
	void Start () {
		pause = false;
		minutes = 0;
		secondes = 0;
		timer_txt.text = "00:00";
	}

	public void startTimer() {
		if (pause) {
			pause = false;
		} 
		else {
			minutes = 0;
			secondes = 0;
		}
		InvokeRepeating ("Tick", 0.0f, 1.0f);	
	}

	public void pauseTimer() {
		pause = true;
		CancelInvoke ("Tick");
	}

	public void resetTimer() {
		CancelInvoke ("Tick");
		pause = false;
		minutes = 0;
		secondes = 0;
		timer_txt.text = "00:00";
	}

	void Tick() {
		// Tick
		secondes++;
		if (secondes >= 60) {
			secondes = 0;
			minutes++;
		}

		// Add '0' if < 10
		if (minutes < 10) {
			timer_txt.text = "0" + minutes + ":";
			if (secondes < 10) timer_txt.text += "0" + secondes;
			else timer_txt.text += secondes;
		} else {
			timer_txt.text = "0" + minutes + ":";
			if (secondes < 10) timer_txt.text += "0" + secondes;
			else timer_txt.text += secondes;
		}
	}
}
