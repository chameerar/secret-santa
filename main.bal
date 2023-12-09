import ballerina/io;
import wso2/choreo.sendemail;
import ballerina/random;
import ballerina/regex;

configurable string[] emails = ["chameera", "lakmini", "isru", "supimi"];
sendemail:Client emailClient = check new ();

public function main() returns error? {
    map<string> assignmentMap = {};
    string[] receivers = emails.slice(0, emails.length());

    boolean allAssigned = false;
    while !allAssigned {
        foreach var i in 0 ... emails.length() - 1 {
            int receiverIndex = check random:createIntInRange(0, receivers.length());
            string giver = emails[i];
            string receiver = receivers[receiverIndex];
            if (giver != receiver) {
                assignmentMap[giver] = receiver;
                _ = receivers.remove(receiverIndex);
            }
        }
        allAssigned = true;
        foreach var i in 0 ... emails.length() - 1 {
            if (assignmentMap[emails[i]] == "") {
                allAssigned = false;
            }
        }
    }
    // string emailResponse = check emailClient->sendEmail(email, "Hello, World!", "Hello, World!");
    io:println("Hello, World!");
    foreach string giver in assignmentMap.keys() {
        string subject = "Secret Santa Assignment";
        string receiver = assignmentMap.get(giver);
        string receiverName = regex:split(receiver, "@")[0];
        string body = "You should give to " + receiverName + "!";
        io:println("Email sending to " + giver + " with subject " + subject + " and body " + body);
        string _ = check emailClient->sendEmail(giver, subject, body);
        io:println("Email sent to " + giver + " with subject " + subject + " and body " + body);
    }
}
