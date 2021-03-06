// Kevin Li - 11:53 PM - 6/23/20

import SwiftUI

struct ElegantHPagesExample: View {

    let manager = ElegantPagesManager(startingPage: 1, pageTurnType: .earlyCutOffDefault)

    init() {
        manager.delegate = self
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ElegantHPages(manager: manager) {
                CustomButtonView()
                CustomView()
                CustomListView()
            }

            ScrollToPageButton(pageCount: 3, action: animatedScroll)
                .padding(.top, 90)
                .padding(.trailing, 30)
        }
    }

    private func animatedScroll(to page: Int) {
        manager.scroll(to: page)
    }

    private func unanimatedScroll(to page: Int) {
        manager.scroll(to: page, animated: false)
    }

}

extension ElegantHPagesExample: ElegantPagesDelegate {

    func elegantPages(willDisplay page: Int) {
        print("Page \(page) will display")
    }

}

struct ElegantHPagesExample_Previews: PreviewProvider {
    static var previews: some View {
        ElegantHPagesExample()
    }
}
