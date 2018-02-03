using UnityEngine;
using Control.Type;

public class InputType : MonoBehaviour
{
	private static InputType _Instance { get; set; }

	public static TYPE Type
	{
		get { return _Instance.CurrentInputType; }
		set { _Instance.CurrentInputType = value; }
	}

	public static Transform Self
	{
		get
		{
			return _Instance.transform;
		}
	}

	public TYPE CurrentInputType;

	private void Start()
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

	private void Awake()
	{
		DontDestroyOnLoad(this);
	}
}
