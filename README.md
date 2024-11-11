<!DOCTYPE html>
<html lang="en">
  
<div class="container">
    <h1>Image Cropper</h1>
    <h3>Some points which you must add in your project(Android and iOS)</h3>

    <!-- open manifest file-->
    <uses-feature android:name="android.hardware.camera"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>  


 <!-- And you have to add this also in the same class -->

     <activity
            android:name="com.yalantis.ucrop.UCropActivity"
            android:screenOrientation="portrait"
            android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
    
</div>

 <h4>It will be added like this</h4>
 <img src="https://github.com/user-attachments/assets/a1934bd7-41f5-4a5b-be3b-f169a6764ef1" width="500" height="250" />


<div class="container">
    <h3>For IOS</h3>
  
    <!-- open manifest file-->
 	  <key>NSCameraUsageDescription</key>
    <string>Testing the Camera integration.</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>To add sounds to the videos you record.</string>
</div>

<br>
<br>
<br>

<div class="container">
  <p><b>You will find the rest of the code in the lib file, so check it out.</b> <br> I hope there is no error in your code.😊 
    <br> If there is any issue in my libraries then I have links to the libraries I have linked to.👇 </p>

  <br>
  <br>
  <br>

  <ul>
  <li><a href="https://pub.dev/packages/permission_handler/install">Permission Handler</a></li>
  <li><a href="https://pub.dev/packages/image_picker/install">Image Picker</a></li>
  <li><a href="https://pub.dev/packages/image_cropper/install">Image Cropper</a></li>
</ul>  
  
</div>


      
</body>
</html>
