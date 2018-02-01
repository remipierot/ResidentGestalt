using UnityEngine;
using Control.Type;

namespace Control
{
	public enum KEY
	{
		UP,
		DOWN,
		LEFT,
		RIGHT,
		INVALID
	}

	public class ControlManager : MonoBehaviour
	{
		private static Controller _Controller;
		private static Keyboard _Keyboard;
		private static float _LastPressedTime;

		private static float _SecondsFromLastPressedTime
		{
			get
			{
				return Time.realtimeSinceStartup - _LastPressedTime;
			}
		}

		public static bool Up
		{
			get
			{
				return _Controller.Up || _Keyboard.Up;
			}
		}

		public static bool Down
		{
			get
			{
				return _Controller.Down || _Keyboard.Down;
			}
		}

		public static bool Left
		{
			get
			{
				return _Controller.Left || _Keyboard.Left;
			}
		}

		public static bool Right
		{
			get
			{
				return _Controller.Right || _Keyboard.Right;
			}
		}

		public static bool InputPressed
		{
			get
			{
				return (Up || Down || Left || Right) && _SecondsFromLastPressedTime > 0.25f;
			}
		}

		public static bool IsKeyPressed(KEY key)
		{
			bool pressed = false;

			switch(key)
			{
				case KEY.UP:
					pressed = Up;
					break;
				case KEY.DOWN:
					pressed = Down;
					break;
				case KEY.LEFT:
					pressed = Left;
					break;
				case KEY.RIGHT:
					pressed = Right;
					break;
			}

			return pressed;
		}

		private void Start()
		{
			_Controller = gameObject.AddComponent<Controller>();
			_Keyboard = gameObject.AddComponent<Keyboard>();
			_LastPressedTime = 0.0f;
		}

		private void Update()
		{
			if(InputPressed)
			{
				_LastPressedTime = Time.realtimeSinceStartup;
			}
		}
	}
}
