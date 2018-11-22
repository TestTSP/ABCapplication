﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace ABCapplication.DTO
{
    public class LS
    {
        public string DataSourceId { get; set; }
        public string SrcId { get; set; }
        public string Site { get; set; }
        public string Type { get; set; }
        public string Name { get; set; }
        public string DnsHostName { get; set; }
        public string Fqdn { get; set; }
        public string Domain { get; set; }
        public string PrimaryUserName { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> LastBoot { get; set; }
        public Nullable<System.DateTime> LastScan { get; set; }
        public string Manufacturer { get; set; }
        public string Model { get; set; }
        public Nullable<long> TotalMemoryMb { get; set; }
        public Nullable<long> TotalDiskSpaceMB { get; set; }
        public string SerialNumber { get; set; }
        public Nullable<bool> Virtual { get; set; }
        public string WmiStatus { get; set; }
        public string SamAccountName { get; set; }
        public Nullable<int> SamAccountType { get; set; }
        public Nullable<bool> Enabled { get; set; }
        public Nullable<bool> PwdRequired { get; set; }
        public Nullable<bool> PwdCanChange { get; set; }
        public Nullable<bool> PwdExpires { get; set; }
        public Nullable<bool> NormalAccount { get; set; }
        public string BiosCaption { get; set; }
        public string BiosManufacturer { get; set; }
        public Nullable<System.DateTime> BiosReleaseDate { get; set; }
        public string BiosSerialNumber { get; set; }
        public Nullable<int> BiosSlicTable { get; set; }
        public Nullable<int> BiosMsdmTable { get; set; }
        public string BiosWindowsEdition { get; set; }
        public string BiosVersion { get; set; }
        public string BaseBoardManufacturer { get; set; }
        public string BaseBoardProduct { get; set; }
        public string BaseBoardSerialNumber { get; set; }
        public string BaseBoardVersion { get; set; }
        public Nullable<byte> OsArchitectureBits { get; set; }
        public string OsFamily { get; set; }
        public Nullable<System.DateTime> OsInstallDate { get; set; }
        public Nullable<long> OsLanguage { get; set; }
        public string OsManufacturer { get; set; }
        public string OsName { get; set; }
        public string OsRegisteredUser { get; set; }
        public string OsSerialNumber { get; set; }
        public string OsServicePackMajorVersion { get; set; }
        public string OsServicePackMinorVersion { get; set; }
        public Nullable<long> OsSku { get; set; }
        public string OsVersion { get; set; }
        public string AdCn { get; set; }
        public string AdCompany { get; set; }
        public Nullable<System.DateTime> AdCreated { get; set; }
        public string AdDescription { get; set; }
        public string AdDistinguishedName { get; set; }
        public Nullable<System.DateTime> AdLastLogon { get; set; }
        public string AdLocation { get; set; }
        public Nullable<int> AdLogonCount { get; set; }
        public Nullable<System.DateTime> AdModified { get; set; }
        public string AdCountryCode { get; set; }
        public Nullable<System.DateTime> AdPwdLastSet { get; set; }
        public string AdUserPrincipalName { get; set; }
        public Nullable<int> Id { get; set; }
    }
}