//
//  File.swift
//  
//
//  Created by Tony Tang on 2021/2/24.
//

import Foundation

public protocol UInt32VersionFormatter {

    func uint32Version(_ strVer: String) -> UInt32

    func stringVersion(_ uint32Ver: UInt32) -> String
}

private class UInt32VersionFormatterDefault: UInt32VersionFormatter {

    func uint32Version(_ strVer: String) -> UInt32 {
        var pieces = strVer.components(separatedBy: ".")
        while pieces.count < 4 {
            pieces.append("0")
        }
        var intVer: UInt32 = 0
        for v in pieces {
            intVer = (intVer << 8) + UInt32((UInt8(v) ?? 0))
        }
        return intVer
    }

    func stringVersion(_ uint32Ver: UInt32) -> String {
        var ver = uint32Ver
        var pieces = [UInt8]()
        for _ in 0..<4 {
            pieces.append(UInt8(truncatingIfNeeded: ver))
            ver = ver >> 8
        }
        return "\(pieces[3]).\(pieces[2]).\(pieces[1]).\(pieces[0])"
    }

}

extension VersionUtil {

    static var uint32Formatter: UInt32VersionFormatter = UInt32VersionFormatterDefault()

}
