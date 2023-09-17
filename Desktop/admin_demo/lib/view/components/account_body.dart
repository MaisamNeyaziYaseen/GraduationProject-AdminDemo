import 'package:flutter/material.dart';

class AccountBody extends StatelessWidget {
  AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85 - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.06,
                          // height: MediaQuery.of(context).size.width * 0.06,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("username")
                      ],
                    ),
                    Icon(Icons.settings_outlined),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.85 - 40,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("First Name"),
                      subtitle: Text("first name"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: ListTile(
                        leading: Icon(Icons.mail_outline),
                        title: Text("your email"),
                        subtitle: Text("emailaddress@gmail.com"),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: ListTile(
                        leading: Icon(Icons.lock_outline),
                        title: Text("your password"),
                        subtitle: Row(
                          children: [
                            for (int i = 0; i < 8; i++)
                              Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                          ],
                        ),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: ListTile(
                        leading: Icon(Icons.call_outlined),
                        title: Text("your phone number"),
                        subtitle: Text("0791623444"),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        title: Text(
                          "sign out",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
