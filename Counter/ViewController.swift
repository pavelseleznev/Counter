//
//  ViewController.swift
//  Counter
//
//  Created by Pavel Seleznev on 10/6/24.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak private var counterLabel: UILabel! // Label shows the counter value
    @IBOutlet weak private var statusTextView: UITextView! // textView displays the status updates after changing the counter value
    
    // MARK: - Private Properties
    lazy private var labelCount: Int = 0 // Variable stores counter's value
    private let now = Date() //
    private let formatter = DateFormatter()
    
    
    // MARK: - IB Actions
    @IBAction private func increaseCountButton(_ sender: Any) { // Button increases the counter's value & adds the status information in the statusTextView
        if labelCount >= 0 {
            labelCount += 1
            formatTimeAndDate()
            let dateString = formatter.string(from: now)
            statusTextView.text.append("\n" + "[\(dateString)]: " + "значение изменено на +1")
            statusTextView.scrollToBottom()
        }
        counterLabel.text = String("Значение счётчика: \(labelCount)")
    }
    
    @IBAction private func decreaseCountButton(_ sender: Any) { // Button decreases the counter's value & adds the status information in the statusTextView
        if labelCount > 0 {
            labelCount -= 1
            formatTimeAndDate()
            let dateString = formatter.string(from: now)
            statusTextView.text.append("\n" + "[\(dateString)]: " + "значение изменено на -1")
            statusTextView.scrollToBottom()
        } else {
            formatTimeAndDate()
            let dateString = formatter.string(from: now)
            statusTextView.text.append("\n" + "[\(dateString)]: " + "попытка уменьшить значение счётчика ниже 0")
            statusTextView.scrollToBottom()
        }
        counterLabel.text = String("Значение счётчика: \(labelCount)")
    }
    
    @IBAction private func resetCountButton(_ sender: Any) { // Button resets the counter's value to 0 & adds the status information in the statusTextView
        labelCount = 0
        counterLabel.text = String("Значение счётчика: \(0)")
        formatTimeAndDate()
        let dateString = formatter.string(from: now)
        statusTextView.text.append("\n" + "[\(dateString)]: " + "значение сброшено")
        statusTextView.scrollToBottom()
    }
    
    // MARK: - Private Method
    private func formatTimeAndDate() {
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
    }
}

private extension UITextView { // This extension provides the scrollToBottom functionality for the statusTextView
    func scrollToBottom() {
        let textCount: Int = text.count
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
}
