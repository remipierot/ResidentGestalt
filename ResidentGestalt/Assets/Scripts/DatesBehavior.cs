using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DatesBehavior : MonoBehaviour 
{

	public int patience = 0; //Prevision

	public Vector3 myDestination;
	public bool destinationReached = true;
	public bool destinationChanged = false;

	Animator m_animator;

	private float destinationReachedTreshold = 1.5f;
	private NavMeshAgent myNavMesh;

	void Awake()
	{
		myNavMesh = this.gameObject.GetComponent<NavMeshAgent> ();
		m_animator = GetComponent<Animator>(); 
	}

	void Update()
	{
		if (!destinationReached) {	
			float distanceToTarget = Vector3.Distance (this.gameObject.GetComponent<Transform> ().position, myDestination);
			if (distanceToTarget < destinationReachedTreshold)
				destinationReached = true;
		} 
	}

	public void setDestination(Vector3 target)
	{
		myDestination = target;
		myNavMesh.SetDestination (myDestination);

		destinationReached = false;
		destinationChanged = true;
	}
}
