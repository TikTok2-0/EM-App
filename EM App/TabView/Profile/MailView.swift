//
//  MailView.swift
//  EM App
//
//  Created by Henry Krieger on 07.04.21.
//

import AVFoundation
import Foundation
import MessageUI
import SwiftUI
import UIKit

struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    var recipients = ["dahydigital@gmail.com"]
    var blindCopy = ["henry.krieger@me.com"]
    var messageBody = "Hey DAHY Digital,"
    var messageTitle = "Feedback EM App iOS"

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>)
        {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?)
        {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
            
            if result == .sent {
            AudioServicesPlayAlertSound(SystemSoundID(1001))
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(recipients)
        vc.setMessageBody(messageBody, isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject(messageTitle)
        //vc.setBccRecipients(blindCopy)
        return vc
    }

    func updateUIViewController(_: MFMailComposeViewController,
                                context _: UIViewControllerRepresentableContext<MailView>) {}
}
