//
//  ContentView.swift
//  BikeSync
//
//  Created by Jonathan Copeland on 13/01/2024.
//

import SwiftUI
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var peripheralNames: [String] = []
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate, CBPeripheralDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "unnamed device")
        }
        
        if (peripheral.name == "ECH-SPORT-087218") {
            peripheral.delegate = self
            self.centralManager?.connect(peripheral)
        }
    }
    
    // Handle peripherals once connected
       func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
           print("Connected to \(peripheral.name ?? "device")")
           peripheral.discoverServices(nil)
       }
       
       // Handle service discovery
       func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
           if let error = error {
               print("Error discovering services: \(error.localizedDescription)")
               return
           }
           
           for service in peripheral.services ?? [] {
               print("Discovered service \(service)")
               peripheral.discoverCharacteristics(nil, for: service)
           }
       }

       // Handle characteristic discovery
       func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
           if let error = error {
               print("Error discovering characteristics: \(error.localizedDescription)")
               return
           }
           
           for characteristic in service.characteristics ?? [] {
               print("Discovered characteristic \(characteristic)")
               peripheral.readValue(for: characteristic)
           }
       }
       
       // Handle updated characteristic value
       func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
           if let data = characteristic.value {
               // handle your data here
               print("Characteristic value updated: \(data)")
           }
       }
    
}

struct ContentView: View {
    
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    
    
    var body: some View {
        NavigationView {
            List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
                Text(peripheral)
            }
            .navigationTitle("Peripheral")
        }
    }
    
}

#Preview {
    ContentView()
}

