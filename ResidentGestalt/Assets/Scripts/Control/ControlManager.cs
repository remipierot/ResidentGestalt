using UnityEngine;
using Control.Type;

namespace Control
{
	public class ControlManager : MonoBehaviour
	{
		public static ControlManager Instance
		{
			get;
			private set;
		}

		private Controller _Controller;
		private Keyboard _Keyboard;

		public static bool Up { get { return Instance._Controller.Up || Instance._Keyboard.Up; } }
		public static bool Down { get { return Instance._Controller.Down || Instance._Keyboard.Down; } }
		public static bool Left { get { return Instance._Controller.Left || Instance._Keyboard.Left; } }
		public static bool Right { get { return Instance._Controller.Right || Instance._Keyboard.Right; } }
		public static bool InputPressed { get { return Up || Down || Left || Right; } }

		private void Start()
		{
			if (Instance == null)
				Instance = this;
			else
				return;

			Instance._Controller = Instance.gameObject.AddComponent<Controller>();
			Instance._Keyboard = Instance.gameObject.AddComponent<Keyboard>();
		}
	}
}
