#! /usr/bin/env python3
import argparse
import sys
import os
import smtplib
from email.message import EmailMessage

parser = argparse.ArgumentParser(description='Send an email through an SMTP server, works for mailgun.')
parser.add_argument('sender', help="From email address.")
parser.add_argument('receiver', help="Email address to send the message to.")
parser.add_argument('subject', help="Subject for the email.")
args = parser.parse_args()

if sys.stdin.isatty():
    print('bork')
    exit(1)

messageContent = sys.stdin.read()
if len(messageContent) == 0:
    exit(1)

msg = EmailMessage()
msg['Subject'] = args.subject
msg['From'] = args.sender
msg['To'] = args.receiver
msg.set_content(messageContent)

# Send the message via MAIL_SERVER.
server = os.environ.get('MAIL_SERVER')
s = smtplib.SMTP(server)
s.starttls()
s.login(os.environ.get('MAIL_USER'), os.environ.get('MAIL_PASSWORD'))
s.send_message(msg)
s.quit()

print(f'Sent message to {args.receiver}')
