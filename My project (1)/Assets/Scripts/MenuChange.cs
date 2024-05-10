using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuChange : MonoBehaviour
{
    // Start is called before the first frame update    // Start is called before the first frame update
private void PlayGame(){
    SceneManager.LoadScene("MainScene");

}
private void Quit(){
    Application.Quit();
}

}
