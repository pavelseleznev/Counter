//
//  ViewController.swift
//  Counter
//
//  Created by Pavel Seleznev on 10/6/24.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    /// Label shows the counter value
    @IBOutlet weak private var counterLabel: UILabel!
    /// textView displays the status updates after changing the counter value
    @IBOutlet weak private var statusTextView: UITextView!
    
    // MARK: - Private Properties
    /// Variable stores counter's value
    lazy private var labelCount: Int = 0
    private let now = Date()
    private let formatter = DateFormatter()
    
    // MARK: - Private Method
    private func formatTimeAndDate() {
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        statusTextView.scrollToBottom()
    }
    
    // MARK: - IB Actions
    /// Button increases the counter's value & adds the status information in the statusTextView
    @IBAction private func increaseCountButton(_ sender: Any) {
        formatTimeAndDate()
        labelCount += 1
        let dateString = formatter.string(from: now)
        statusTextView.text.append("\n" + "[\(dateString)]: " + "значение изменено на +1")
        counterLabel.text = String("Значение счётчика: \(labelCount)")
    }
    
    /// Button decreases the counter's value & adds the status information in the statusTextView
    @IBAction private func decreaseCountButton(_ sender: Any) {
        formatTimeAndDate()
        let dateString = formatter.string(from: now)
        if labelCount > 0 {
            labelCount -= 1
            statusTextView.text.append("\n" + "[\(dateString)]: " + "значение изменено на -1")
        } else {
            statusTextView.text.append("\n" + "[\(dateString)]: " + "попытка уменьшить значение счётчика ниже 0")
        }
        counterLabel.text = String("Значение счётчика: \(labelCount)")
    }
    
    /// Button resets the counter's value to 0 & adds the status information in the statusTextView
    @IBAction private func resetCountButton(_ sender: Any) {
        formatTimeAndDate()
        counterLabel.text = String("Значение счётчика: \(0)")
        let dateString = formatter.string(from: now)
        statusTextView.text.append("\n" + "[\(dateString)]: " + "значение сброшено")
    }
}

/// This extension provides the scrollToBottom functionality for the statusTextView
private extension UITextView {
    func scrollToBottom() {
        let textCount: Int = text.count
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
}
