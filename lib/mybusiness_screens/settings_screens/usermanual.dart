import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lezrapp/Const.dart';

class UserManualScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String htmlContent = '''
    <!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="https://3.6.0.86/lezr/image/favicon-logo.ico" />
	<meta name="viewport" content="width=device-width">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>User Manual || LezrApp </title>
	<meta name="description" content="User Manual || LezrApp " />
	<meta property="og:title" content="User Manual || LezrApp " />

	<!-- BOOTSTRAP -->
	<link rel="stylesheet" href="https://3.6.0.86/lezr/assets/chat/bootstrap.min.css">
	<link rel="stylesheet" href="https://3.6.0.86/lezr/assets/chat/bootstrap-theme.min.css">

	<!-- FONTS -->
	<link href="https://3.6.0.86/lezr/assets/chat/fonts.css" rel="stylesheet">


	<!-- STYLESHEETS -->
	<link rel="stylesheet" type="text/css" href="https://3.6.0.86/lezr/assets/chat/style.css">
	<link rel="stylesheet" type="text/css" href="https://3.6.0.86/lezr/assets/chat/style-responsive.css">

	<!-- Place your kit's code here -->
	<script src="https://3.6.0.86/lezr/assets/chat/font-awesome.js"></script>
	<style>
		body {
			overflow: auto !important;
		}

		.discussion-header {
			background: white !important;
		}
	</style>
</head>

<body>

	<div class="container-fluid wrapper-chat">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-12">
				<div class="row">
					<div class="col-lg-12 col-md-12 discussion-header">
						<div class="row">
							<div class="col-lg-12 col-md-12 text-center mt-3">
								<h2>LezrApp</h2>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12" style="background: #f9f9f9;">
						<h2 class="mt-3">User Manual</h2>

					</div>
					<div class="col-lg-12 col-md-12 " style="background: #f9f9f9;">
						<h4>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 12px; line-height: normal; font-family: 'Helvetica Neue';">
									<h1 style="color: #ff0000;">
										<span style="font-stretch: normal; font-size: 15px; line-height: normal;"><strong>Add Customer from Phone Contacts:&nbsp;</strong></span>
									</h1>
									Go to <strong>Homepage</strong> &gt;select &ldquo;<strong>Customers</strong>&rdquo;
									&gt; select the Phonebook icon on top of the screen and select a contact you wish to
									add.
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 12px; line-height: normal; font-family: 'Helvetica Neue';">
									<span style="font-stretch: normal; font-size: 15px; line-height: normal;"><strong><span style="color: #ff0000;">Add Customer directly&nbsp; &nbsp;</span>&nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp;&nbsp;</strong></span><span style="font-stretch: normal; font-size: 15px; line-height: normal;"><strong>&nbsp;</strong></span>Go
									to <strong>Homepage</strong> &gt;select &ldquo;<strong>Customers</strong>&rdquo;
									&gt; select the Customer icon &gt; enter Customer Information &gt; select
									&ldquo;<strong>SAVE</strong>&rdquo;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 12px; line-height: normal; font-family: 'Helvetica Neue';">
									<span style="font-stretch: normal; font-size: 15px; line-height: normal;"><strong>Add Supplier from Phone Contacts&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></span>Go
									to <strong>Homepage</strong> &gt;select &ldquo;<strong>Suppliers</strong>&rdquo;
									&gt; select the Phonebook icon on top of the screen and select a contact you wish to
									add.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 12px; line-height: normal; font-family: 'Helvetica Neue';">
									<span style="font-stretch: normal; font-size: 15px; line-height: normal;"><strong>Add Supplier directly&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></span>Go
									to <strong>Homepage </strong>&gt;select &ldquo;<strong>Suppliers</strong>&rdquo;
									&gt; select the Supplier icon &gt; enter Supplier Information &gt; select
									&ldquo;<strong>SAVE</strong>&rdquo;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View All Customers&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong><span style="font-stretch: normal; font-size: 12px; line-height: normal;">Go to <strong>Homepage</strong> &gt;select &ldquo;<strong>Customers</strong>&rdquo;&nbsp;</span>
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View All Suppliers&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong><span style="font-stretch: normal; font-size: 12px; line-height: normal;">Go to <strong>Homepage</strong> &gt;select &ldquo;<strong>Suppliers</strong>&rdquo;</span>
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Add Expense &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>Add Expense</strong>&rdquo;
									&gt; add the type of expense from the list.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Expenses &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select
									&ldquo;<strong>View Expenses</strong>&rdquo;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Add a new Staff device&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>Manage Staff</strong>&rdquo;
									&gt; select the Add option on the top&nbsp; &gt; Enter Staff Information &gt; select
									&ldquo;<strong>SAVE</strong>&rdquo; . Now you can provide the&nbsp; Registered
									mobile number and Password to your Staff to Login as a Staff.&nbsp;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View all Active Staff devices &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>Manage Staff</strong>&rdquo;
									. Here you can view the list of all active staff devices.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Edit a Customer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt;select &ldquo;<strong>Customers</strong>&rdquo;
									&gt; select the desired Customer &gt; click on the
									&ldquo;<strong>Edit</strong>&rdquo; icon. After editing is done , click on
									&ldquo;<strong>SAVE</strong>&rdquo; .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Delete a Customer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>Customers</strong>&rdquo;
									&gt; select the desired Customer &gt; click on the
									&ldquo;<strong>Delete</strong>&rdquo; icon &amp; enter the captcha code to confirm.
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Edit a Supplier &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>Suppliers</strong>&rdquo;
									&gt; select the desired Supplier &gt; Click on the
									&ldquo;<strong>Edit</strong>&rdquo; icon. After Editing is done , click on
									&ldquo;<strong>SAVE</strong>&rdquo; .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Delete a Supplier &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>Customers</strong>&rdquo;
									&gt; select the desired Customer &gt; click on the
									&ldquo;<strong>Delete</strong>&rdquo; icon &amp; enter the captcha code to confirm.
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Flag a Supplier&nbsp;</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Flag a Customer</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Flagged Customers / Suppliers</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View All Transactions &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select
									&ldquo;<strong>View Transactions</strong>&rdquo;. Select
									&ldquo;<strong>Sort</strong>&rdquo; or &ldquo;<strong>Filter</strong>&rdquo; to view
									transactions as per your preference .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Today's transactions &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>View Reports</strong>&rdquo;
									&gt; Select &ldquo;<strong>Todays Transactions</strong>&rdquo;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Sales statement&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; click on
									&ldquo;<strong>YOU WILL GET&hellip;</strong>&rdquo; . Here you can select the year
									from the top of the screen to view the Sales&nbsp; Statement for the year you want.
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Purchase statement&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; click on
									&ldquo;<strong>YOU WILL PAY&hellip;</strong>&rdquo; . Here you can select the year
									from the top of the screen to view the Purchase Statement for the year you want.
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Business Reports&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;<strong>View Reports</strong>&rdquo;
									. Here you can view and download various Business reports .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Know your Business Health&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select
									&ldquo;<strong>Business Health</strong>&rdquo; .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View your Live Business Game Ranking&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; click on &ldquo;<strong>Your Rank</strong>&rdquo;
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Add a Customer Transaction&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;
									<strong>Add Transaction</strong>&rdquo; &gt; select the Customer you want and enter
									the required information ( Date , Details , Transactional pictures , Due Date
									,Amount , Transaction Type , Screen Signature ) and then Select
									&ldquo;<strong>SAVE</strong>&rdquo;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OR
							</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp; &nbsp; Go to <strong>Homepage</strong>&gt; select
								&ldquo;<strong>Customers</strong>&rdquo; and search for the required &nbsp; &nbsp;
								&nbsp; &nbsp; customer, after selecting the customer you need to select the
								&ldquo;<strong>+</strong>&rdquo;icon .Then provide the required information ( Date ,
								Details , Transactional pictures , Due Date ,Amount , Transaction Type , Screen
								Signature ) &amp; select &ldquo;<strong>SAVE</strong>&rdquo;.</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OR
							</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp; &nbsp; Go to <strong>Homepage</strong>&gt; search for the required customer /
								supplier from the Search bar on the top and select the &ldquo;<strong>+</strong>&rdquo;
								icon , then provide the required information ( Date , Details , Transactional pictures ,
								Due Date ,Amount , Transaction Type , Screen Signature ) &amp; select
								&ldquo;<strong>SAVE</strong>&rdquo;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Add a Supplier Transaction &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong> &gt; select &ldquo;
									<strong>Add Transaction</strong>&rdquo; &gt; select the Supplier you want by
									selecting &ldquo;<strong>SUPPLIER</strong>&rdquo; from bottom of the screen and
									enter the required information ( Date , Details , Transactional pictures , Due Date
									,Amount , Transaction Type , Screen Signature ) and then Select
									&ldquo;<strong>SAVE</strong>&rdquo;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OR</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								Go to <strong>Homepage</strong>&gt; select &ldquo;<strong>Suppliers</strong>&rdquo; and
								search for the required &nbsp; &nbsp; &nbsp; &nbsp; customer, after selecting the
								customer you need to select the &ldquo;<strong>+</strong>&rdquo;icon .Then provide the
								required information ( Date , Details , Transactional pictures , Due Date ,Amount ,
								Transaction Type , Screen Signature ) &amp; select &ldquo;<strong>SAVE</strong>&rdquo;.
							</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OR
							</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp; &nbsp; Go to <strong>Homepage</strong>&gt; search for the required customer /
								supplier from the Search bar on the top and select the &ldquo;<strong>+</strong>&rdquo;
								icon , then provide the required information ( Date , Details , Transactional pictures ,
								Due Date ,Amount , Transaction Type , Screen Signature ) &amp; select
								&ldquo;<strong>SAVE</strong>&rdquo;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Remove&nbsp; a transaction. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; search and select the required customer / supplier
									.Then go to the transaction you want to remove and swipe from right and select
									&ldquo;<strong>Remove</strong>&rdquo;,next you need to enter the captcha code to
									confirm the deletion process.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 17px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Edit a transaction &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; search and select the required customer / supplier
									.Then go to the transaction you want to edit and swipe from right and select
									&ldquo;<strong>Edit</strong>&rdquo;.After the edition is done , select
									&ldquo;<strong>SAVE</strong>&rdquo; .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Business Analytics&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; select &ldquo;<strong>Analytics</strong>&rdquo;
									&gt; select from list the analytical report you want to view.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Sharing Business Card&nbsp;</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Payment Reminders&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt;search and select the required customer &gt; click
									on &ldquo;<strong>Reminder</strong>&rdquo; &gt; select the type of reminder you want
									to send ( <strong>SMS</strong> / <strong>Whatsapp</strong> ).</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View / Edit Business Profile&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; select &ldquo;<strong>Settings</strong>&rdquo;&gt;
									select &ldquo;<strong>Profile</strong>&rdquo;.Here if you wish to edit the profile ,
									make the changes and click on &ldquo;<strong>SAVE</strong>&rdquo;.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 17px;">
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Search Customer / Supplier&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; click on the search bar and type the name of the
									desired customer / supplier .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Customer / Supplier information&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; click on the search bar and type the name of the
									desired customer / supplier , then select the customer / supplier to view the
									details.</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Call a Customer / Supplier&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; click on the search bar and type the name of the
									desired customer / supplier , then select the customer / supplier you need to call
									and click on &ldquo;Call&rdquo;&nbsp;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Sharing Account statement of Customer&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; Search for the desired customer using the search
									option and select the customer you want.Then click on the sharing option on the top
									of the menu and select the sharing mode you want to use.&nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; OR</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp; Go to <strong>Homepage</strong>&gt;select
								&ldquo;<strong>Customers</strong>&rdquo; and search for the desired&nbsp; &nbsp; &nbsp;
								customer using the search option and select the customer you want.Then click on the
								sharing option on the top of the menu and select the sharing mode you want to use.</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 17px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Sharing Account statement of Supplier&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; Search for the desired supplier using the search
									option and select the supplier you want.Then click on the sharing option on the top
									of the menu and select the sharing mode you want to use.&nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp;</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; OR</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
								&nbsp; Go to <strong>Homepage</strong>&gt;select
								&ldquo;<strong>Suppliers</strong>&rdquo; and search for the desired&nbsp; &nbsp; &nbsp;
								supplier using the search option and select the customer you want.Then click on the
								sharing option on the top of the menu and select the sharing mode you want to use.</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Export Account statement of Customer&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; Search for the desired customer using the search
									option and select the customer you want.Then select the &ldquo;Export&rdquo; option
									to export the statement in .PDF format&nbsp; and save it in your desired location .
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Export Account statement of Supplier &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>Go
									to <strong>Homepage</strong>&gt; Search for the desired supplier using the search
									option and select the supplier you want.Then select the &ldquo;Export&rdquo; option
									to export the statement in .PDF format&nbsp; and save it in your desired location .
								</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Send Payment reminder to Customers </strong>Go to
									<strong>Homepage</strong>&gt; Search for the desired supplier using the search
									option and select the supplier you want.Then select the &ldquo;Reminder&rdquo;
									option &amp; select the reminder option you wish to use .</li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Add Screen Signature to a transaction.</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Add Transactional pictures</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Sharing Transactional pictures</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Sharing Account Statement</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Customers Outstanding</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>View Suppliers Outstanding</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Enable / Disable Login PIN</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Change 4 Digit Login PIN</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Change Staff Login Password</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Manage Multiple Business Accounts</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<ul>
								<li
									style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue';">
									<strong>Know who did a Transaction</strong></li>
							</ul>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
							<p
								style="margin: 0px; font-stretch: normal; font-size: 15px; line-height: normal; font-family: 'Helvetica Neue'; min-height: 18px;">
								&nbsp;</p>
							<p class="MsoNormal" style="text-align: justify; text-justify: inter-ideograph;"
								align="justify">&nbsp;</p>
						</h4>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://3.6.0.86/lezr/assets/chat/jquery.min.js"></script>
	<script src="https://3.6.0.86/lezr/assets/chat/index.js"></script>

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