using UnityEngine;

namespace Control.Type
{
	public enum TYPE
	{
		KEYBOARD,
		CONTROLLER
	}

	public abstract class Controls : MonoBehaviour
	{
		public bool Up { get; protected set; }
		public bool Down { get; protected set; }
		public bool Left { get; protected set; }
		public bool Right { get; protected set; }

		public bool Y { get { return Up; } }
		public bool A { get { return Down; } }
		public bool X { get { return Left; } }
		public bool B { get { return Right; } }
	}
}
