using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RayShooter : MonoBehaviour
{
    private Camera _cam;
    private GameObject spherePrefab;
    CsoundUnity csoundUnity;

    private void Start()
    {
        _cam = GetComponent<Camera>();
        spherePrefab = Resources.Load<GameObject>("spherePrefab");

          csoundUnity = FindObjectOfType<CsoundUnity>();
         if (csoundUnity == null)
    {
        Debug.LogError("CsoundUnity component not found!");
    }


        // Lock cursor to the middle of the screen and hide it.
       // Cursor.lockState = CursorLockMode.Locked;
       // Cursor.visible = false;
    }

    private void Update()
    {
        if(!PauseMenu.isPaused){// Left click
        if (Input.GetMouseButtonDown(0))
        {
            // Create a point at the middle of the viewport
            Vector3 point = new(_cam.pixelWidth / 2, _cam.pixelHeight / 2, 0);

            // Create a ray to the created point
            Ray ray = _cam.ScreenPointToRay(point);

            // Data structure to record information about the ray collision
            RaycastHit hit;
            float maxDistance = 25f; 

            // Check if the created ray collided with any geometry
            if (Physics.Raycast(ray, out hit))
            {
                // Retrieve GameObject ray collided with.
                GameObject hitObj = hit.transform.gameObject;
                //Tree target = hitObj.GetComponent<Tree>();
                StartCoroutine(SphereIndicator(hit.point));
               // if (target != null){
                   // target.ReactToHit();
                  // Debug.Log("Hit");
                  // csoundUnity.SendScoreEvent("i\"1\" 0 .5");}
               // else{
                    //StartCoroutine(SphereIndicator(hit.point));
                //}
            }
            else{
            Vector3 shootPosition = ray.GetPoint(maxDistance); // Get the point at the maximum distance along the ray
            StartCoroutine(SphereIndicator(shootPosition));
            }
        }
        }
    }

    // OnGUI runs after the scene has been rendered.
    void CastRay(){
             Vector3 point = new(_cam.pixelWidth / 2, _cam.pixelHeight / 2, 0);

            // Create a ray to the created point
            Ray ray = _cam.ScreenPointToRay(point);

            // Data structure to record information about the ray collision
            RaycastHit hit;
            float maxDistance = 25f; 
    }
    void OnGUI()
    {
        // Size of the rectangular GUI that will contain the text.
        int size = 12;

        // Position of the text. Note that subtracting the scaled size will
        // ensure that the star is centered.
        float posX = _cam.pixelWidth / 2 - size / 4;
        float posY = _cam.pixelHeight / 2 - size / 2;

        // Change the color of the GUI's contents to red.
        GUI.contentColor = Color.red;

        // Render a label that defines a position and the text it contains.
        GUI.Label(new Rect(posX, posY, size, size), "X");
    }

    IEnumerator SphereIndicator(Vector3 pos)
    {
        // Create and place a sphere where the hit collided.
       // GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
       GameObject sphere = Instantiate(spherePrefab, pos, Quaternion.identity);
        sphere.transform.position = pos;
       // Rigidbody rb = sphere.AddComponent<Rigidbody>();
        //rb.useGravity = true;
        

        yield return new WaitForSeconds(8);

        Destroy(sphere);
    }
}
