CREATE TABLE [doctors] (
  [id] serial,
  [name] varchar(20),
  [surename] varchar(30),
  [address_id] int,
  [phone_nr] varchar(20),
  [email] varchar(255)
)
GO

CREATE TABLE [patient] (
  [id] serial,
  [name] varchar(20),
  [surename] varchar(30),
  [address_id] int,
  [insurance_comp] varchar(255)
)
GO

CREATE TABLE [address] (
  [id] serial,
  [street] varchar(255),
  [home_number] varchar(10),
  [city] varchar(100),
  [ZIP_code] varchar(6)
)
GO

CREATE TABLE [Medicine] (
  [id] serial,
  [product] varchar(255),
  [price_insurance] float,
  [price_patient] float,
  [unit] varchar(10)
)
GO

CREATE TABLE [recept] (
  [id] serial,
  [doctor_id] int,
  [patient_id] int,
  [valid_from] datetime,
  [valid_to] datetime,
  [released] boolean
)
GO

CREATE TABLE [list_of_medicine] (
  [recept_id] int,
  [medicine_id] int,
  [ammount] int
)
GO

ALTER TABLE [address] ADD FOREIGN KEY ([id]) REFERENCES [doctors] ([id])
GO

ALTER TABLE [address] ADD FOREIGN KEY ([id]) REFERENCES [patient] ([address_id])
GO

ALTER TABLE [recept] ADD FOREIGN KEY ([doctor_id]) REFERENCES [doctors] ([id])
GO

ALTER TABLE [recept] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([id])
GO

ALTER TABLE [list_of_medicine] ADD FOREIGN KEY ([recept_id]) REFERENCES [recept] ([id])
GO

ALTER TABLE [list_of_medicine] ADD FOREIGN KEY ([medicine_id]) REFERENCES [Medicine] ([id])
GO
