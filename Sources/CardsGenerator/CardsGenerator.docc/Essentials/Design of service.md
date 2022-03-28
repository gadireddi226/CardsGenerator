# Design of service

Described behaviour of the service

## Requirements
* generates only items (based on ids), that are valid based on current user guidelines and history
* the generated sequence should be prioritized by some logic
* the service should be dumb and take only ids (it should be a string that signifies the identity of object)

## Prioritization
The service counts its occurences of active guidelines in history and based on it. The guidelines/items are ordered in incremental order. In other words the item with no history should have the highest priority.

## Topics
### Additional usefull articles
- <doc:What-ID-should-have-custom-item>
