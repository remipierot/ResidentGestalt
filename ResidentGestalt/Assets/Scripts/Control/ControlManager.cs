using UnityEngine;
using Control.Type;

namespace Control
{
	public class ControlManager : MonoBehaviour
	{
		private static Controller _Controller;
		private static Keyboard _Keyboard;

		public static bool Up { get { return _Controller.Up || _Keyboard.Up; } }
		public static bool Down { get { return _Controller.Down || _Keyboard.Down; } }
		public static bool Left { get { return _Controller.Left || _Keyboard.Left; } }
		public static bool Right { get { return _Controller.Right || _Keyboard.Right; } }
		public static bool InputPressed { get { return Up || Down || Left || Right; } }

		private void Start()
		{
			_Controller = gameObject.AddComponent<Controller>();
			_Keyboard = gameObject.AddComponent<Keyboard>();
		}
	}
}
