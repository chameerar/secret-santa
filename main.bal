import ballerina/io;
import wso2/choreo.sendemail;
// import ballerina/random;

configurable string [] emails = [];
sendemail:Client emailClient = check new ();
public function main() returns error? {
    // map<string> assignmentMap = {};
    
    // foreach var i in 0...emails.length() {
    //     int randomInt = check random:createIntInRange(0, emails.length());
    //     string giver = emails[i];
    //     string receiver = emails[randomInt];
    // }
    // boolean allAssigned = false;
    // while  !allAssigned {
    //     foreach var i in 0...emails.length() {
    //         int randomInt = check random:createIntInRange(0, emails.length());
    //         string giver = emails[i];
    //         string receiver = emails[randomInt];
    //         if (giver != receiver) {
    //             assignmentMap[giver] = receiver;
    //         }
    //     }
    //     allAssigned = true;
    //     foreach var i in 0...emails.length() {
    //         if (assignmentMap[emails[i]] == "") {
    //             allAssigned = false;
    //         }
    //     }
        
    // }
    // int randomInt = check random:createIntInRange(0, emails.length());

    // string emailResponse = check emailClient->sendEmail(email, "Hello, World!", "Hello, World!");
    io:println("Hello, World!");
}
