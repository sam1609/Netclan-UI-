import 'package:flutter/material.dart';
import 'main.dart';

class RefinePage extends StatefulWidget {
  @override
  _RefinePageState createState() => _RefinePageState();
}

class _RefinePageState extends State<RefinePage> {
  double _currentValue = 50.0; // Initial value (50 km)
  String availabilityValue = 'Available | Hey Lets Connect';
  TextEditingController statusController =
      TextEditingController(text: 'Hi community! I am open to new connections');

  final int maxStatusLength = 250; // Maximum character limit for status
  bool button1Clicked = false;
  bool button2Clicked = false;
  bool button3Clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   padding: EdgeInsets.all(10),
            //   child:
            Text(
              'Select Your Availability',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            // ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: availabilityValue,
                onChanged: (String? newValue) {
                  setState(() {
                    availabilityValue = newValue!;
                  });
                },
                items: <String>[
                  'Available | Hey Lets Connect',
                  'Away | Stay Discreet And Watch',
                  'Busy | Do Not Disturb | Will Catch Up Later',
                  'SOS | Emergency! Need Assistance! HELP',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 20),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   padding: EdgeInsets.all(10),
            //   child:
            Text(
              'Add Your Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            // ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey, width: 0.5), // Add black border
              ),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: statusController,
                maxLines: 5,
                maxLength: maxStatusLength,
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the default border
                  hintStyle:
                      TextStyle(fontSize: 15), // Set the font size for the hint
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              'Select Hyperlocal Distance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('1 km'),
                Expanded(
                  child: Column(
                    children: [
                      Tooltip(
                        message: _currentValue.toStringAsFixed(0),
                        child: Slider(
                          value: _currentValue,
                          min: 1.0,
                          max: 100.0,
                          onChanged: (value) {
                            setState(() {
                              _currentValue = value;
                            });
                          },
                          divisions: ((100 - 1) / 1).toInt(),
                        ),
                      ),
                      Text(
                        'Selected Value: ${_currentValue.toStringAsFixed(0)} km',
                      ),
                    ],
                  ),
                ),
                Text('100 km'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Purpose',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  color: button1Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button1Clicked = !button1Clicked;
                    });
                  },
                  name: 'Coffee      ',
                ),
                RoundedButton(
                  color: button2Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button2Clicked = !button2Clicked;
                    });
                  },
                  name: 'Business    ',
                ),
                RoundedButton(
                  color: button3Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button3Clicked = !button3Clicked;
                    });
                  },
                  name: 'Hobbies     ',
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  color: button1Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button1Clicked = !button1Clicked;
                    });
                  },
                  name: 'Friendship  ',
                ),
                RoundedButton(
                  color: button2Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button2Clicked = !button2Clicked;
                    });
                  },
                  name: 'Movies      ',
                ),
                RoundedButton(
                  color: button3Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button3Clicked = !button3Clicked;
                    });
                  },
                  name: 'Dining      ',
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  color: button1Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button1Clicked = !button1Clicked;
                    });
                  },
                  name: 'Dating      ',
                ),
                RoundedButton(
                  color: button2Clicked
                      ? Color.fromARGB(255, 26, 66, 99)
                      : Colors.white,
                  onPressed: () {
                    setState(() {
                      button2Clicked = !button2Clicked;
                    });
                  },
                  name: 'Matrimony   ',
                ),
                SizedBox(width: 100)
              ],
            ),
            SizedBox(height: 50),
            Center(
                child: RoundedButton2(
              color: button3Clicked
                  ? Color.fromARGB(255, 26, 66, 99)
                  : Color.fromARGB(255, 26, 66, 99),
              onPressed: () {
                setState(() {
                  button3Clicked = !button3Clicked;
                });
              },
              name: '     Save & Explore     ',
            )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    statusController.dispose();
    super.dispose();
  }
}

class RoundedButton2 extends StatefulWidget {
  final Color color;
  final VoidCallback onPressed;
  final String name;

  RoundedButton2({
    required this.color,
    required this.onPressed,
    required this.name,
  });

  @override
  _RoundedButtonState2 createState() => _RoundedButtonState2();
}

class _RoundedButtonState2 extends State<RoundedButton2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 26, 66, 99),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          widget.onPressed();
        },
        child: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
