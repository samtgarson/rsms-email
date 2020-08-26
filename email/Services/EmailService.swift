//
//  EmailService.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import Foundation

fileprivate let sam = User(name: "Sam Hennessy", email: "sam.h@fixvideo.com")
fileprivate let frank = User(name: "Frank Yamamoto", email: "frankie78@gmail.com")

class EmailService {
    var threads: [EmailThread] {
        [
            defaultThread(),
            customThread,
            defaultThread(),
            defaultThread(read: false),
            defaultThread(read: false),
            defaultThread(),
            defaultThread(read: false),
            defaultThread(),
            defaultThread(),
            defaultThread()
        ]
    }
    
    let customThread = EmailThread(emails: [
        Email(subject: "Calling the Pinball Wizard", body: """
Hello Robin!

I was wondering if you'd be interested in helping us out at the community center next Sunday? We're having a new pinball machine arriving tomorrow and since you're the OG pinball wizard...
""", receivedAt: Date(timeIntervalSinceNow: 86400 * 3), from: sam),
        Email(subject: "Re: Calling the Pinball Wizard", body: """
Sam, good to hear from you. That sounds really funky! Yeah, I'm in. What time were you thinking?
Also, let me loop in Frank who may be interested as well
""", receivedAt: Date(timeIntervalSinceNow: 86400 * 2), from: currentUser, copied: [frank]),
        Email(subject: "Re: Calling the Pinball Wizard", body: """
Howdy.
This sounds fun but unfortunately I'm out of town next weekend.
Have fun and thanks for asking!
""", receivedAt: Date(timeIntervalSinceNow: 86400), from: frank, copied: [sam]),
        Email(subject: "Re: Calling the Pinball Wizard", body: """
Robin, we're starting to set up around 9am and open at 10:30. You can park in the employee parking lot as usual if you want.
We've got cookies and beer!
Gimme a ring in case anything happens, otherwise I'll see you on Sunday morning.
""", receivedAt: Date(timeIntervalSinceNow: 86400 / 2), from: sam, copied: [frank])
    ])
    
    private func defaultThread (read: Bool = true) -> EmailThread {
        EmailThread(emails: [
            Email(subject: "Thread title", body: "Hey Robin, how's it going?", receivedAt: Date(timeIntervalSinceNow: -7200), from: frank),
            Email(subject: "Thread title", body: "Hello Frank! I was wondering if you'd like to meet for coffee", receivedAt: Date(timeIntervalSinceNow: -3600), read: read, from: sam)
        ])
    }
}
