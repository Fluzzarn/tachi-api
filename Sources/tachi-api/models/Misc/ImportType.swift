//
//  File.swift
//  
//
//  Created by Dan Mclean on 3/10/22.
//

import Foundation


public enum ImportType: String, Codable {
    case eamuse = "file/eamusement-iidx-csv"
    case batchManual = "file/batch-manual"
    case solidStateSquad = "file/solid-state-squad"
    case merIIDX = "file/mer-iidx"
    case pliIIDX = "file/pli-iidx-csv"
    case directManual = "ir/direct-manual"
    case barbatos = "ir/barbatos"
    case fervidex = "ir/fervidex"
    case fervidexStatic = "ir/fervidex-static"
    case usc = "ir/usc"
    case beatoraja = "ir/beatoraja"
    case floIIDX = "api/flo-iidx"
    case eagIIDX = "api/eag-iidx"
    case floSDVX = "api/flo-sdvx"
    case eagSDVX = "api/eag-sdvx"
    case minSDVX = "api/min-sdvx"
    case arcIIDX = "api/arc-iidx"
    case arcSDVX = "api/arc-sdvx"
}
