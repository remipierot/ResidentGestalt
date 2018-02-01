using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Timer : MonoBehaviour {

	float time_to_attain = 5000.0f;
	public float time_left = 0;
	float ratio = 0.0f;
	float last_time = 0.0f;
	bool running = false;
	public bool oot = false;

	// Use this for initialization
	void Start () {
		GetComponent<Renderer> ().material.SetFloat ("__Cutoff", 0.0f);
		last_time = Time.time * 1000;
	}

	void Update() {

		if (running) {
			time_left = (Time.time * 1000) - last_time;
			ratio = time_left / time_to_attain;
			GetComponent<Renderer> ().material.SetFloat ("__Cutoff", ratio);
			if (time_left >= time_to_attain) {
				running = false;
				oot = true;
			}
		}
	}

	public void newEvent(float tim) {
		time_to_attain = tim;
		last_time = Time.time * 1000;
		time_left = 0.0f;
		ratio = 0.0f;
		running = true;
		oot = false;
		GetComponent<Renderer> ().material.SetFloat ("__Cutoff", 0.0f);
	}

	public void pause() {
		running = false;
	}

	public void unpause() {
		running = true;
	}
}
