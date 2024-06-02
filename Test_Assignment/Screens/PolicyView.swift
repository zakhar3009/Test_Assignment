//
//  PolicyView.swift
//  Test_Assignment
//
//  Created by Zakhar Litvinchuk on 31.05.2024.
//

import SwiftUI

struct PolicyView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .top) {
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                BackButtonView()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Text("""
                    TERMS
                    In addition to the terms set out in the standard “LICENSED APPLICATION END USER LICENSE AGREEMENT” (can be found here http://www.apple.com/legal/internet-services/itunes/appstore/dev/stdeula/), users agree to the Application collecting certain detailed user information indicated in EULA & PRIVACY POLICY below.
                    1. INTRODUCTION
                    This Privacy Policy applies when you use any of the Apps of this publisher and should be read together with the End User License Agreement EULA. By using a Publisher’s App, you are consenting to our processing of your information in ways set out in this Privacy Policy. If you do not agree with it, please do not use any Publisher’s Apps. In certain cases, for example, if geolocation data is processed by the relevant Publisher’s App, the Publisher’s App will prompt you to give additional consent. In such case, you can choose not to give consent to us processing data related to your location but you can still use the Publisher’s App.This Privacy Policy may change so you should review it regularly. We will notify you of any material changes in the way we treat your information through the Publisher’s Apps you use.
                    2. DATA WE COLLECT
                    When you use an Publisher’s App, Publisher may collect data, including information which
                    """)
                .font(.system(size: 17))
                .foregroundStyle(.white)
                .padding(.top, 15)
                
            }
            .padding(.horizontal, 15)
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    PolicyView()
}

