using UnityEngine;
using Control;

public class KeyDisplay : MonoBehaviour
{
	private static KeyDisplay _Instance { get; set; }

	public GameObject Up;
	public GameObject Down;
	public GameObject Left;
	public GameObject Right;

	public GameObject UpEmpty;
	public GameObject DownEmpty;
	public GameObject LeftEmpty;
	public GameObject RightEmpty;

	public static bool IsDisplayed
	{
		get
		{
			return !_Instance.UpEmpty.activeInHierarchy || 
				!_Instance.DownEmpty.activeInHierarchy || 
				!_Instance.LeftEmpty.activeInHierarchy || 
				!_Instance.RightEmpty.activeInHierarchy;
		}
	}

	void Start ()
	{
		if(_Instance == null)
		{
			_Instance = this;
		}
		else
		{
			return;
		}
	}

	public static void RandomizePositions()
	{
		int firstKey = Random.Range(0, 4);
		int secondKey = Random.Range(0, 4);

		while(secondKey == firstKey)
		{
			secondKey = Random.Range(0, 4);
		}

		int thirdKey = Random.Range(0, 4);

		while (thirdKey == firstKey || thirdKey == secondKey)
		{
			thirdKey = Random.Range(0, 4);
		}

		int fourthKey = Random.Range(0, 4);

		while (fourthKey == firstKey || fourthKey == secondKey || fourthKey == thirdKey)
		{
			fourthKey = Random.Range(0, 4);
		}

		_PlaceSingleKey(KEY.UP, firstKey);
		_PlaceSingleKey(KEY.DOWN, secondKey);
		_PlaceSingleKey(KEY.LEFT, thirdKey);
		_PlaceSingleKey(KEY.RIGHT, fourthKey);
	}

	public static KEY FakeKey(KEY key)
	{
		GameObject keyObject = _Instance.Up;

		switch (key)
		{
			case KEY.UP:
				keyObject = _Instance.Up;
				break;
			case KEY.DOWN:
				keyObject = _Instance.Down;
				break;
			case KEY.LEFT:
				keyObject = _Instance.Left;
				break;
			case KEY.RIGHT:
				keyObject = _Instance.Right;
				break;
		}

		float distToUp = (keyObject.transform.position - _Instance.UpEmpty.transform.position).magnitude;
		float distToDown = (keyObject.transform.position - _Instance.DownEmpty.transform.position).magnitude;
		float distToLeft = (keyObject.transform.position - _Instance.LeftEmpty.transform.position).magnitude;
		float distToRight = (keyObject.transform.position - _Instance.RightEmpty.transform.position).magnitude;

		if(distToUp < distToDown && distToUp < distToLeft && distToUp < distToRight)
		{
			return KEY.UP;
		}
		else if (distToDown < distToUp && distToDown < distToLeft && distToDown < distToRight)
		{
			return KEY.DOWN;
		}
		else if (distToLeft < distToUp && distToLeft < distToDown && distToLeft < distToRight)
		{
			return KEY.LEFT;
		}
		else if (distToRight < distToUp && distToRight < distToDown && distToRight < distToLeft)
		{
			return KEY.RIGHT;
		}

		return KEY.INVALID;
	}

	private static void _PlaceSingleKey(KEY key, int newId)
	{
		GameObject keyObject = _Instance.Up;

		switch (key)
		{
			case KEY.UP:
				keyObject = _Instance.Up;
				break;
			case KEY.DOWN:
				keyObject = _Instance.Down;
				break;
			case KEY.LEFT:
				keyObject = _Instance.Left;
				break;
			case KEY.RIGHT:
				keyObject = _Instance.Right;
				break;
		}

		switch (newId)
		{
			case 0:
				keyObject.transform.position = _Instance.UpEmpty.transform.position;
				break;
			case 1:
				keyObject.transform.position = _Instance.DownEmpty.transform.position;
				break;
			case 2:
				keyObject.transform.position = _Instance.LeftEmpty.transform.position;
				break;
			case 3:
				keyObject.transform.position = _Instance.RightEmpty.transform.position;
				break;
		}

		Vector3 truePosition = keyObject.transform.localPosition;
		truePosition.z = 0.0f;
		keyObject.transform.localPosition = truePosition;
	}

	public static void ResetPositions()
	{
		_Instance.Up.transform.position = _Instance.UpEmpty.transform.position;
		_Instance.Down.transform.position = _Instance.DownEmpty.transform.position;
		_Instance.Left.transform.position = _Instance.LeftEmpty.transform.position;
		_Instance.Right.transform.position = _Instance.RightEmpty.transform.position;
	}

	public static void HideAll()
	{
		_Instance.UpEmpty.SetActive(true);
		_Instance.DownEmpty.SetActive(true);
		_Instance.LeftEmpty.SetActive(true);
		_Instance.RightEmpty.SetActive(true);
	}

	public static void Show(KEY key)
	{
		KEY k = FakeKey(key);

		switch(k)
		{
			case KEY.UP:
				_Instance.UpEmpty.SetActive(false);
				break;
			case KEY.DOWN:
				_Instance.DownEmpty.SetActive(false);
				break;
			case KEY.LEFT:
				_Instance.LeftEmpty.SetActive(false);
				break;
			case KEY.RIGHT:
				_Instance.RightEmpty.SetActive(false);
				break;
		}
	}
}
