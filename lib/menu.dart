import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU DE OPCIONES',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Color.fromARGB(255, 6, 67, 146),
      ),      
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, '/paciente/index'); 
                    },  
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 107, 170, 241)),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                         Icon(
                          Icons.people_alt,
                            color: Colors.black,                                  
                        ),
                        SizedBox(height: 10,),
                        Text('GESTION PACIENTE',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 0, 0, 0)
                          ),
                        ),
                      ],
                    )
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, '/medico/index'); 
                    },  
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 159, 165, 219)),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                         Icon(
                          Icons.book,
                            color: Colors.black,                                  
                        ),
                        SizedBox(height: 15,),
                        Text('GESTION MEDICO',
                          style: TextStyle(
                           fontSize: 12, 
                           color: const Color.fromARGB(255, 0, 0, 0)
                          ),
                        ),
                      ],
                    )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Paciente'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Camara'
          )
        ],
        currentIndex: 0,
        selectedItemColor: Color.fromARGB(255, 6, 67, 146),
        onTap: (index) {
          if (index == 0) {
            Navigator.popUntil(context, ModalRoute.withName('/menu')); 
          } else if (index == 1) {
            Navigator.pushNamed(context, '/paciente/index'); 
          } else if (index == 2) {
            Navigator.pushNamed(context, '/camara'); 
          }
        },
      ),
    );
  }
}
