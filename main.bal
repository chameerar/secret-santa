import ballerina/io;
import wso2/choreo.sendemail;

configurable string email = "";
sendemail:Client emailClient = check new ();
public function main() returns error? {
    string emailResponse = check emailClient->sendEmail(email, "Hello, World!", "Hello, World!");
    io:println(emailResponse);
}
