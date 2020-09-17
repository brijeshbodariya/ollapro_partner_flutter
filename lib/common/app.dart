import 'dart:ui';

import 'package:flutter/material.dart';

class App {
  static const appName = "OLLAPRO";
  static const font = "Roboto";
  static const partnerLogin = "Partner Login";
  static const credentials = "Enter your credentials to continue";
  static const mobileNumber = "Mobile Number";
  static const altMobileNumber = "Alternate Mobile Number";
  static const loginButton = "LOGIN";
  static const password = "Password";
  static const rememberMe = "Remember Me";
  static const forgotPassword = "Forgot Password?";
  static const loginToRegisterButton = "OPS.. I DON'T HAVE AN ACCOUNT YET";
  static const createYourAccount = "Create your Account";
  static const enterYourDetails = "Enter your details";
  static const fullName = "Full Name";
  static const emailAddress = "Email Address";
  static const confirmPassword = "Confirm Password";
  static const registerButton = "REGISTER";
  static const verificationCodeText = "Verification Code";
  static const verifyText = "Please enter the 6 digits verification code";
  static const verifyButton = "VERIFY";
  static const codeText = "Didn't receive the code";
  static const resendCodeButton = "RESEND CODE";
  static const forgotText = "Forgot Password";
  static const mobileText = "Please enter your mobile number";
  static const submitButton = "SUBMIT";
  static const completeYourKyc = "Complete Your KYC";
  static const skip = "Skip";
  static const personalDetail = "PERSONAL DETAILS";
  static const title = "Title";
  static const fName = "First Name";
  static const lName = "Last Name";
  static const mName = "Middle Name";
  static const dob = "Date of Birth";
  static const gender = "Gender";
  static const language = "Language Known";
  static const fatherName = "Father's Name";
  static const nextButton = "NEXT";
  static const backButton = "BACK";
  static const contactDetail = "CONTACT DETAILS";
  static const communicationAddress = "Communication Address";
  static const exactPlace = "Exact Place";
  static const pinCode = "Pin Code";
  static const state = "State";
  static const city = "City";
  static const place = "Place";
  static const aadhar = "Aadhar Number";
  static const pan = "PAN Number";
  static const gst = "GSTIN";
  static const identifyDetail = "IDENTIFY DETAILS";
  static const bankDetail = "BANK DETAILS";
  static const address = "Address";
  static const referenceDetail = "REFERENCE";
  static const reference1 = "References 1";
  static const reference2 = "References 2";
  static const bankName = "Bank Name";
  static const accountNumber = "Account Number";
  static const account1Number = "Re-type Account Number";
  static const nameOfHolder = "Name of Account Holder";
  static const accountType = "Account Type";
  static const ifscCode = "IFSC Code";
  static const uploadDocument = "UPLOAD DOCUMENTS";
  static const name = "Name";
  static const photo1 = "Photo 1";
  static const photo2 = "Photo 2";
  static const chooseFile = "Choose File";
  static const aadharFront = "Aadhar Front";
  static const aadharback = "Aadhar Back";
  static const panCard = "PAN Card";
  static const cancelledCheque = "Cancelled Cheque";
  static const selfAttested = "Self Attested Declaration";
  static const dashBoardTitle = "My DashBoard";
  static const property = "Property";
  static const landlordTitle = "Landlord";
  static const tenantTitle = "Tenant";
  static const addTenantTitle = "Add New Tenant";
  static const rewardBasket = "Reward Basket";
  static const seeAll = "See All";
  static const newListProperty = "New List Properties";
  static const nonVerifiedTenantText = "Non Verified Tenant";
  static const addNewLandLordButton = "ADD NEW LANDLORD";
  static const addPropertyButton = "ADD NEW PROPERTY";
  static const addNewTenantButton = "ADD NEW TENANT";
  static const addNewLandLordTitle = "Add New LandLord";
  static const addPropertyTitle = "Add New Property";
  static const landmark = "Landmark(if any)";
  static const district = "District";
  static const propertyTitleText = "Property Title";
  static const location = "LOCATION";
  static const typeOfAcc = "TYPE OF ACCOMMODATION";
  static const selectType = "Select Type";
  static const residential = "Residential";
  static const hostel = "Hostel";
  static const other = "Other";
  static const commercial = "Commercial";
  static const booking = "Booking";
  static const uploadPicture = "Upload Pictures";
  static const payout = "Payouts";
  static const reward = "Reward";
  static const balance = "BALANCE";
  static const view = "View";
  static const transfer = "Transfer";
  static const history = "History";
  static const claim = "Claim";
  static const tranHistory = "Transactions History";
  static const landLordID = "Landlord ID";
  static const amount = "Amount-";
  static const debitAmount = "DEBIT AMOUNT";
  static const rewardCatalog = "REWARD CATALOG";
  static const claimRedeemTitle = "CLAIM/REDEEM";
  static const offerDetailTitle = "Offer Details";
  static const claimNowButton = "CLAIM NOW";






  //images
  static const splashBg = "assets/splashbg.png";
  static const splashLogo = "assets/splashlogo.png";
  static const loginBg = "assets/loginBg.png";
  static const visibility = "assets/view.png";
  static const backButtonLogo = "assets/back@2x.png";
  static const passwordLogo = "assets/password.png";
  static const checkedButtonLogo = "assets/checked@2x.png";
  static const mobileLogo = "assets/mobile.png";
  static const unCheckedButtonLogo = "assets/uncheck@2x.png";
  static const emailLogo = "assets/email.png";
  static const personLogo = "assets/user.png";
  static const calendarLogo = "assets/calendar.png";
  static const dashBoardBg = "assets/main-bg@3x.png";
  static const bannerDashLogo = "assets/banner@3x.png";
  static const landLordDashLogo = "assets/landlord@2x.png";
  static const leftArrowLogo = "assets/left-arrow.png";
  static const menuDrawerLogo = "assets/menu.png";
  static const notificationLogo = "assets/notification@2x.png";
  static const tenantUSer = "assets/nv-tenant@2x.png";
  static const propertyLogo = "assets/property@2x.png";
  static const property1Logo = "assets/property-1@3x.png";
  static const rewardBasketLogo = "assets/reward-basket@2x.png";
  static const shareLogo = "assets/share@2x.png";
  static const tenantLogo = "assets/tenant@2x.png";
  static const userImage = "assets/user@2x.png";
  static const delete = "assets/delete@2x.png";
  static const arrowBack = "assets/arrow@2x.png";
  static const report = "assets/report@2x.png";
  static const sideMenu = "assets/sidemenu@2x.png";
  static const addButton = "assets/add@2x.png";
  static const verifiedLogo = "assets/verified@2x.png";
  static const uploadLogo = "assets/upload@2x.png";
  static const blackCard = "assets/black-bg@3x.png";
  static const yellowCard = "assets/orange-bg@3x.png";
  static const transactionLogo = "assets/transaction@2x.png";
  static const failedLogo = "assets/failed@2x.png";
  static const processLogo = "assets/process@2x.png";
  static const successLogo = "assets/success@2x.png";
  static const laptopLogo = "assets/laptop@2x.png";
  static const giftLogo = "assets/gift@2x.png";
  static const dotLogo = "assets/dot@2x.png";
  static const laptopWinnerLogo = "assets/laptop@3x.png";
  static const phoneLogo = "assets/mobile@2x.png";
  static const scratchLogo = "assets/bg@2x.png";
}

//Colors
final Color primaryColor = Color(0xFF000000);
final Color secondaryColor = Color(0xFF868d92);
final Color yellow = Color(0xFFe59607);
final Color white = Color(0xFFf3f3f3);
final Color red = Colors.red;
final Color grey = Colors.grey.shade300;
final Color grey1 = Colors.grey.shade400;
final Color green = Colors.green;
