using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Timer : MonoBehaviour {

	float time_to_attain = 5000.0f;
	float t = 0;
	float ratio = 0.0f;
	float last_time = 0.0f;
	bool running = true;

	// Use this for initialization
	void Start () {
		GetComponent<Renderer> ().material.SetFloat ("__Cutoff", 0.0f);
		last_time = Time.time * 1000;
	}

	void Update() {

		if (running) {
			t = (Time.time * 1000) - last_time;
			ratio = t / time_to_attain;
			GetComponent<Renderer> ().material.SetFloat ("__Cutoff", ratio);
			if (t >= time_to_attain) {
				running = false;

				// DEBUG
				newEvent (time_to_attain);	
			}
		}
	}

	public void newEvent(float tim) {
		time_to_attain = tim;
		last_time = Time.time * 1000;
		t = 0.0f;
		ratio = 0.0f;
		GetComponent<Renderer> ().material.SetFloat ("__Cutoff", 0.0f);
	}

	public void pause() {
		running = false;
	}

	public void unpause() {
		running = true;
	}
}
