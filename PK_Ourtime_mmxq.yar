rule PK_Ourtime_mmxq : Ourtime_mmxq
{
    meta:
        description = "Phishing Kit - OurTime.com - mmxq"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2019-12-16"
        comment = "Phishing Kit - OurTime.com - mmxq"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific file found in PhishingKit
        $spec_file = "mmxq.html"
        $spec_file2 = "wp-root.php"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        // check for file
        $spec_file and
        $spec_file2
}

