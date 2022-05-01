# Postmortem

A postmortem is a tool meant to give an incident report incase of an outage.

<img src="https://media.giphy.com/media/xUNd9L49btcYko8jwQ/giphy.gif"/>

## Issue summary  

From 1:06 AM to 2:46 AM EAT, requests to the company's servers resulted in 503 error response messages. All the services served by the servers returned a 503 status code. The outage affected 100% of traffic to the servers. The websites served were all down. The root cause of this outage was a DDoS attack that overloaded the servers' RAM.  

## Timeline

* 1:06 AM - Outage begins
* 1:06 AM - DataDog monitoring systems alerted developers
* 1:10 AM - Alerted key stakeholders and security provider
* 1:10 AM - Activated countermeasures
* 1:37 AM - Monitored attack progression
* 1:40 AM - Assessed defense performance
* 1:51 AM - Successfully stopped the attack
* 1:54 AM - Analyzed the attack
* 2:11 AM - Assessed damages and Identified weak spots
* 2:30 AM - Verification of security vendor SLA
* 2:39 AM - Servers restart begin
* 2:46 AM - 100% traffic online

## Root cause and resolution

At 1:06 AM EAT, an outage triggered a monitoring system alert. The engineers investigated and it was discovered that the servers were undergoing a volume-based DDoS attack. The websites were flooded with a high volume of traffic and connections, overwhelming their bandwidth and servers. This caused a RAM overload on the servers.  
An automatic communication system alerted the stakeholders and customers of the situation.  

The network team implemented a IP-based Access Control Lists (ACLs) to block all the traffic from attack sources. The attack was coming from a single source.  
Throughout the attack, the progression was measured to see how it developed overtime. This was to help the security team tune the defenses. As the countermeasures were being rolled out at 1:10 AM, the ongoing effectiveness was measured.  
The SLA document provided by the security vemdor was verified.  

## Corrective and preventative measures

Once the attack was fully curbed, it was analyzed in much detail as possible.  
Most of the information was obtained from the internal network and application system logs.  
All the vulnerable assets were mapped by listing all external-facing assets that might potentially be attacked.  
The team then came up with a list of things to accomplish in preparation af an iminent attack:
* Assess potential damages like loss of revenue and customers
* Assign responsibilities according to the assessed damages
* Set up detection mechanisms
* Deploy a DDoS protection solution
The company is fully committed to patch up any weak spots on the systems to prevent any future attacks. We appreciate your patience and sincerely apologize for the inconveniences caused. Thank you for your cooperation and support.

Sincerely,
	The Hum security team.
