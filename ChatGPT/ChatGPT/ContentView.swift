//
//  ContentView.swift
//  ChatGPT
//
//  Created by Jonathan Copeland on 17/02/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var chatMessages: [ChatMessage] = []
    @State var messageText: String = ""
    let openAIService = OpenAIService()
    @State var cancellables = Set<AnyCancellable>()
    @State var conversation: String = ""

    
    var body: some View {
        NavigationView() {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(chatMessages, id: \.id) { message in
                            messageView(message: message)
                        }
                    }
                }
                HStack {
                    HStack {
                        TextField("Enter a message", text: $messageText){
                            
                        }
                        .font(.body)
                        .padding(.leading, 12)
                            
                        Button {
                            sendMessage()
                        } label: {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.largeTitle)
                        }
                    }
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                        .stroke(lineWidth: 2)
                        .opacity(0.05)
                    )
                    
                    
                    
                    
                    
                    

                }
            }
            .padding()
            
        }
        

    }
    
    
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .me {Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .gpt {Spacer()}
        }
        
    }
    
    func sendMessage() {
        
        saveConversation()
        let conversationAndMessage: String = conversation + messageText
        
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMessages.append(myMessage)
        openAIService.sendMessage(message: conversationAndMessage).sink { completion in
            // error response
        } receiveValue: { response in
            guard let  textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else {return}
            let gptMessage = ChatMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .gpt)
            chatMessages.append(gptMessage)
        }
        .store(in: &cancellables)
        
        messageText = ""
    }
    
    func saveConversation() {
        conversation = ""
        
        for message in chatMessages {
            conversation.append("\(message.content)")
            conversation.append(" ")
        }
        
    }
    
    
}


struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from gpt", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from gpt", dateCreated: Date(), sender: .gpt)
    ]
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

