using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sequencer : MonoBehaviour
{
    private CsoundUnity cSound;
    public GameObject[] cubes;
    private int currentBeat = 0;
    public int tempo = 2;
    public int interval = 3; 

    void Start()
    { 
        cSound = FindObjectOfType<CsoundUnity>();
        cSound.SetChannel("tempo", tempo);
        Debug.Log("Tempo set");
        cSound.SetChannel("interval", interval);
        Debug.Log("interval set");
    }

    void Update()
    {
        if(Input.GetKeyDown("=")){
            tempo++;
            Debug.Log("Tempo Increased");
            cSound.SetChannel("tempo",tempo);
        }
        else if (Input.GetKeyDown("-")){
            tempo--;
            Debug.Log("Tempo Decreased");
            cSound.SetChannel("tempo",tempo);  
        }
    }

    void ResizeCube(int index)
    {
        for( int i = 0; i<8; i++)
        {
            if (i==index)
            {
                cubes[i].gameObject.transform.localScale = new Vector3(2, 2, 2);
            }
            else
            {
                cubes[i].gameObject.transform.localScale= new Vector3(1, 1, 1);
            }
        }
    }

    public void EnableCubeToPlaySound(int index)
    {
        cSound.SetChannel("updateTable", index - 1);
    }
}