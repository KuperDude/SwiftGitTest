//
//  SomeViewForUnitTest.swift
//  SwiftGitTest
//
//  Created by MyBook on 15.06.2024.
//

import SwiftUI

struct SomeViewForUnitTest: View {
    @StateObject var vm = SomeViewModelForUnitTest(isPremium: true)
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

#Preview {
    SomeViewForUnitTest()
}
