using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class GameManager : MonoBehaviour {


	public List<GameObject> Dates;
	public List<NavMeshAgent> NavMeshes;

	public Transform tableDate;
	public Transform outside;

	public int currentDate = 0;

	public int test = 0;

	// Use this for initialization
	void Start () {

		currentDate = 0;
		dateGoTo (currentDate, tableDate.position);
	}
	
	// Update is called once per frame
	void Update () {


		dateGoTo (currentDate, tableDate.position);
		if (NavMeshes [currentDate].isStopped)
			test = 1;
		else
			test = 2;


	}


	void dateGoTo(int indexDate, Vector3 position)
	{
		NavMeshes [indexDate].SetDestination (position);
	}
}
