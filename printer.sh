#!/bin/bash
echo "########################################################################"
echo "###                                                                  ###"
echo "###     Welcome! This Script will ADD Printer to your system         ###"
echo "###                                                                  ###"
echo "########################################################################"

echo
echo
# -E = Enable printer
# -p = Name of printer
# -v = Ip address of the printer
# -P = Path to PPD of printer
# -D = Description of printer
# -o = To Check or Uncheck the share button
# lpd = line Protocol Daemon
# PPD = PostScript Printer Description 

lpadmin -E -p "Ground_Floor" -v "lpd://172.16.16.9" -P "/Library/Printers/PPDs/Contents/Resources/CNPZUIR3225ZU.ppd.gz" -D "Ground Floor" -o printer-is-shared=false


# Enable the printer after adding ( By Default it's paused)
cupsenable Ground_Floor



echo
echo  " Printer Has been Added to Your System. Enjoy! "
say "Printers Added"
echo
echo
echo "########################################################################"
echo "###                                                                  ###"
echo "###          Script Created by:  Shailender Choudhary                ###"
echo "###                                                                  ###"
echo "########################################################################"
