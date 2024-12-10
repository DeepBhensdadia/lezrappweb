import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lezrapp/Const.dart';

class UserManualScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String htmlContent = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>

    <h2>Adding Customers and Suppliers</h2>
    <p><strong>Add Customer from Phone Contacts:</strong> Go to Homepage > select “Customers” > select the Phonebook icon on top of the screen and select a contact you wish to add.</p>
    <p><strong>Add Customer directly:</strong> Go to Homepage > select “Customers” > select the Customer icon > enter Customer Information > select “SAVE”.</p>
    <p><strong>Add Supplier from Phone Contacts:</strong> Go to Homepage > select “Suppliers” > select the Phonebook icon on top of the screen and select a contact you wish to add.</p>
    <p><strong>Add Supplier directly:</strong> Go to Homepage > select “Suppliers” > select the Supplier icon > enter Supplier Information > select “SAVE”.</p>

    <h2>Viewing Customers and Suppliers</h2>
    <p><strong>View All Customers:</strong> Go to Homepage > select “Customers”.</p>
    <p><strong>View All Suppliers:</strong> Go to Homepage > select “Suppliers”.</p>

    <h2>Managing Expenses</h2>
    <p><strong>Add Expense:</strong> Go to Homepage > select “Add Expense” > add the type of expense from the list.</p>
    <p><strong>View Expenses:</strong> Go to Homepage > select “View Expenses”.</p>

    <h2>Managing Staff Devices</h2>
    <p><strong>Add a new Staff device:</strong> Go to Homepage > select “Manage Staff” > select the Add option on the top > Enter Staff Information > select “SAVE”. Now you can provide the Registered mobile number and Password to your Staff to Login as a Staff.</p>
    <p><strong>View all Active Staff devices:</strong> Go to Homepage > select “Manage Staff”. Here you can view the list of all active staff devices.</p>

    <h2>Editing and Deleting Customers and Suppliers</h2>
    <p><strong>Edit a Customer:</strong> Go to Homepage > select “Customers” > select the desired Customer > click on the “Edit” icon. After editing is done click on “SAVE”.</p>
    <p><strong>Delete a Customer:</strong> Go to Homepage > select “Customers” > select the desired Customer > click on the “Delete” icon & enter the captcha code to confirm.</p>
    <p><strong>Edit a Supplier:</strong> Go to Homepage > select “Suppliers” > select the desired Supplier > click on the “Edit” icon. After editing is done click on “SAVE”.</p>
    <p><strong>Delete a Supplier:</strong> Go to Homepage > select “Suppliers” > select the desired Supplier > click on the “Delete” icon & enter the captcha code to confirm.</p>

    <h2>Flagging Customers and Suppliers</h2>
    <p><strong>Flag a Customer / Supplier:</strong> Search and select a customer/supplier you wish to add a flag & click on the “Add Flag” option > Next the customer/supplier will be displayed as “Flagged “.</p>
    <p><strong>Remove Flag from a Customer / Supplier:</strong> Search and select a customer/supplier you wish to add a flag & click on the “Remove Flag” option.</p>
    <p><strong>View Flagged Customers / Suppliers:</strong> Go to Homepage > select “Flagged “ to view all the customers/suppliers you have flagged.</p>

    <h2>Managing Transactions</h2>
    <p><strong>View All Transactions:</strong> Go to Homepage > select “View Transactions”. Select “Sort” or “Filter” to view transactions as per your preference.</p>
    <p><strong>View Today's transactions:</strong> Go to Homepage > select “View Reports” > select “Today's Transactions”.</p>
    <p><strong>View Sales statement:</strong> Go to Homepage > click on “YOU WILL GET”. Here you can select the year from the top of the screen to view the Sales Statement for the year you want.</p>
    <p><strong>View Purchase statement:</strong> Go to Homepage > click on “YOU WILL PAY”. Here you can select the year from the top of the screen to view the Purchase Statement for the year you want.</p>
    
    <h2>Business Reports and Analytics</h2>
    <p><strong>View Business Reports:</strong> Go to Homepage > select “View Reports”. Here you can view and download various Business reports.</p>
    <p><strong>Know your Business Health:</strong> Go to Homepage > select “Business Health”.</p>
    <p><strong>View Business Analytics:</strong> Go to Homepage > select “Analytics” > select from list the analytical report you want to view.</p>

    <h2>Adding Transactions</h2>
    <p><strong>Add a Customer Transaction:</strong> Go to Homepage > select “Add Transaction” > select the Customer you want and enter the required information and then select “SAVE”.</p>
    <p><strong>Add a Supplier Transaction:</strong> Go to Homepage > select “Add Transaction” > select the Supplier you want and enter the required information and then select “SAVE”.</p>

    <h2>Editing and Removing Transactions</h2>
    <p><strong>Remove a transaction:</strong> Go to Homepage > search and select the required customer/supplier. Then go to the transaction you want to remove, swipe from the right, and select “Remove” next you need to enter the captcha code to confirm the deletion process.</p>
    <p><strong>Edit a transaction:</strong> Go to Homepage > search and select the required customer/supplier. Then go to the transaction you want to edit, swipe from the right, and select “Edit”. After the edition is done select “SAVE”.</p>

    <h2>Additional Features</h2>
    <p><strong>Sharing Business Card:</strong> Go to Homepage > select “Business Card” and swipe on the card designs to select a card. Make changes if needed and select “SHARE”.</p>
    <p><strong>Payment Reminders:</strong> Go to Homepage > search and select the required customer > click on “Reminder” > select the type of reminder you want to send (SMS / WhatsApp).</p>
    <p><strong>View / Edit Business Profile:</strong> Go to Homepage > select “Settings” > select “Profile”. Make changes and click on “SAVE”.</p>
    <p><strong>Search Customer / Supplier:</strong> Go to Homepage > click on the search bar and type the name of the desired customer/supplier.</p>
    <p><strong>View Customer / Supplier information:</strong> Go to Homepage > click on the search bar and type the name of the desired customer/supplier then select the customer/supplier to view the details.</p>
    <p><strong>Call a Customer / Supplier:</strong> Go to Homepage > click on the search bar and type the name of the desired customer/supplier then select the customer/supplier you need to call and click on “Call”.</p>
    <p><strong>Sharing Account Statement of Customer:</strong> Go to Homepage > search for the desired customer using the search option and select the customer you want. Then click on the sharing option on the top of the menu and select the sharing mode you want to use.</p>
    <p><strong>Sharing Account Statement of Supplier:</strong> Go to Homepage > search for the desired supplier using the search option and select the supplier you want. Then click on the sharing option on the top of the menu and select the sharing mode you want to use.</p>
    <p><strong>Export Account statement of Customer:</strong> Go to Homepage > search for the desired customer using the search option and select the customer you want. Then select the “Export” option to export the statement in .PDF format and save it in your desired location.</p>
    <p><strong>Export Account statement of Supplier:</strong> Go to Homepage > search for the desired supplier using the search option and select the supplier you want. Then select the “Export” option to export the statement in .PDF format and save it in your desired location.</p>
    <p><strong>Send Payment reminder to Customers:</strong> Go to Homepage > search for the desired customer using the search option and select the customer you want. Then select the “Reminder” option & select the reminder option you wish to use.</p>

    <h2>Security and Settings</h2>
    <p><strong>Enable / Disable Login PIN:</strong> Go to Homepage > select “Settings” > select “Set Pin”. Here you can enable / disable the Login Pin & while turning it ON you will be prompted to change the PIN.</p>
    <p><strong>Change Staff Login Password:</strong> Go to Homepage > select “Manage Staff” > select the staff whose password you wish to change & swipe from right to select the “Edit” option. After changing the password you need to select “Save” to confirm.</p>
    <p><strong>Block a Staff Login:</strong> Go to Homepage > select “Manage Staff” > select the staff whose password you wish to change & swipe from right to select the “Edit” option. Next, you need to turn off the toggle button “Active” and select “Save” to confirm.</p>

    <h2>Managing Multiple Business Accounts</h2>
    <p><strong>Manage Multiple Business Accounts:</strong> Go to Homepage > select “Settings” > select “Add Business” and click on the “+” symbol to add a new business. After adding the new business, select the business account you want to use.</p>
    <p><strong>Change Currency:</strong> Go to Homepage > select “Settings” > select “Set Currency” and select the desired currency.</p>
    <p><strong>Change Language:</strong> Go to Homepage > select “Settings” > select “Change Language” and select the desired language.</p>
</body>
</html>
''';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom,
        title: Text('User Manual'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: HtmlWidget(htmlContent),
        ),
      ),
    );
  }
}