using UnityEngine;

public static class Util {

	public static Vector3 GetBoundingBoxPoint(Bounds b, Vector3 direction)
    {
        if (direction == Vector3.zero) return Vector3.zero;

        direction = b.center + direction.normalized * b.extents.magnitude; //Considers a circle with radius = bounds radius
        direction.x = Mathf.Clamp(direction.x, b.min.x, b.max.x); //Clamps all axes to the box's surface
        direction.y = Mathf.Clamp(direction.y, b.min.y, b.max.y);
        direction.z = Mathf.Clamp(direction.z, b.min.z, b.max.z);
        return direction;
    }

    public static bool CheckFlag<T>(T state, T flag) where T : struct
    {
        if (!typeof(T).IsEnum)
            throw new System.ArgumentException("CheckFlag type must be an enumerated type");

        int stateValue = (int)(object)state;
        int flagValue = (int)(object)flag;

        return (stateValue & flagValue) != 0;
    }
}
