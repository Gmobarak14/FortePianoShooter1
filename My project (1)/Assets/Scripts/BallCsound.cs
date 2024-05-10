using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallCsound : MonoBehaviour
{
    private CsoundUnity csoundUnity;
    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
       
        
    }
     private void OnCollisionEnter(Collision other) {
        Debug.Log("Hit Collision");
        csoundUnity.SendScoreEvent("i1 0 0.6");
           if (other.gameObject.name == "Tree")
        {
            Debug.Log("Hit Tree");
            csoundUnity.SendScoreEvent("i2 0 0.9");
        }
     }
}
