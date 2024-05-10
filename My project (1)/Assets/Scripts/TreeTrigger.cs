using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreeTrigger : MonoBehaviour
{
    // Start is called before the first frame update
    private CsoundUnity csoundUnity;
    [SerializeField] private int interval = 3; 
    [SerializeField] private int tempo = 2;
    void Start()
    {  GameObject sequencer = GameObject.Find("Sequencer");
       //csoundUnity = player.GetComponent<CsoundUnity>();
       csoundUnity = sequencer.GetComponent<CsoundUnity>();
       if (csoundUnity == null)
        {
            Debug.LogError("CsoundUnity component not found on the SEQUENCER GameObject.");
        }
         csoundUnity.GetChannel("interval");
          csoundUnity.GetChannel("tempo");
        csoundUnity.SetChannel("tempo", tempo);
        Debug.Log("Tempo set");
        csoundUnity.SetChannel("interval", interval);
        Debug.Log("interval set");
       // Debug.Log(interval);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

     private void OnCollisionEnter(Collision other) {
        Debug.Log("Hit Sequencer + interval");
        interval++;
        csoundUnity.SetChannel("interval", interval);
        Debug.Log(interval);

    }
}
