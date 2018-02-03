using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlockSambaDancer : MonoBehaviour {

	public Transform real_pos;
	public Transform samba_hips;

	// Use this for initialization
	void Start () {
		
	}

	void Update() {



	}

	void OnAnimatorMove()
	{
		Animator animator = GetComponent<Animator>(); 

		if (animator)
		{

			samba_hips.position = new Vector3 (real_pos.position.x, samba_hips.position.y, real_pos.position.z);
		}
	}

	void LateUpdate () {
		samba_hips.position = new Vector3 (real_pos.position.x, samba_hips.position.y, real_pos.position.z);
	}
}
