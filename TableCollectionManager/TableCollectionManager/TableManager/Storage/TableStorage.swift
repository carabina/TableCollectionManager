//
//  TableStorage.swift
//
//  Copyright (c) 2020 Dmytro Mishchenko (https://github.com/DimaMishchenko)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public final class TableStorage: Storage {
  
  // MARK: - Properties
  
  public let sectionsHandler: TableSectionsHandler
  
  // MARK: - Init
  
  public init() {
    sectionsHandler = TableSectionsHandler(sections: [])
  }
  
  public init(sections: [TableSection] = []) {
    sectionsHandler = TableSectionsHandler(sections: sections)
  }
  
  public init(rows: [TableRowItem] = []) {
    sectionsHandler = TableSectionsHandler(sections: [TableSection(rows: rows)])
  }
  
  // MARK: - Header/Footer
  
  public func setHeader(_ header: SectionsHandlerItem.SectionItem.HeaderItem, to sectionIndex: Int) {
    guard let section = section(at: sectionIndex) else {
      logError("Failed to add header. Invalid section index \(sectionIndex)")
      return
    }
    section.header = header
    performUpdate(.reloadSections(at: [sectionIndex]))
  }
  
  public func setFooter(_ footer: SectionsHandlerItem.SectionItem.FooterItem, to sectionIndex: Int) {
    guard let section = section(at: sectionIndex) else {
      logError("Failed to add footer. Invalid section index \(sectionIndex)")
      return
    }
    section.footer = footer
    performUpdate(.reloadSections(at: [sectionIndex]))
  }
}
