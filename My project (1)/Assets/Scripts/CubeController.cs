using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CubeController : MonoBehaviour

{
private Renderer rend;
public bool state = false;
private int cubeIndex;
public GameObject camera;
Color offColor, onColor;
    // Start is called before the first frame update
    void Start()
    {
        offColor = new Color();
        ColorUtility.TryParseHtmlString (" #050045FF", out offColor);
        onColor = new Color();
        ColorUtility.TryParseHtmlString (" #004511FF", out onColor);

        string cubeName = gameObject.name; 
        int.TryParse(cubeName.Substring(cubeName.IndexOf("(")+1, 1), out cubeIndex);
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
  void OnMouseDown() {
    if (state == false)
    {
        gameObject.GetComponent<Renderer>().material.color = onColor;
    }
    else{
        gameObject.GetComponent<Renderer>().material.color = offColor;
    }
    state =! state;

    //GameObject camera = GameObject.Find("Player");
    camera.GetComponent<Sequencer>().EnableCubeToPlaySound(cubeIndex);
 }
}
