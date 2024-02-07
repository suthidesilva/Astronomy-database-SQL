.open Astro.db
.mode box
.headers ON
PRAGMA foreign_keys = OFF;

CREATE TABLE Galaxies (
  GalaxyID INTEGER,
  GalaxyName TINYTEXT NOT NULL,
  PRIMARY KEY (GalaxyID)
);

CREATE TABLE StarSystems (
  StarSystemID INTEGER,
  StarSystemName TINYTEXT NOT NULL,
  GalaxyID INTEGER,
  PRIMARY KEY (StarSystemID),
  FOREIGN KEY (GalaxyID) REFERENCES Galaxies(GalaxyID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Planets (
  PlanetID INTEGER,
  PlanetName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (PlanetID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PhysicalAttributes (
  AttributeID INTEGER,
  Mass REAL,
  Diameter REAL,
  Circumference REAL,
  DistanceFromEarth REAL,
  GravitationalForce REAL,
  YearsOfLifeSpan REAL,
  PRIMARY KEY (AttributeID)
);

CREATE TABLE EMSpectrumInformation (
  EMSinfoID INTEGER,
  Luminosity REAL,
  SurfaceColor TINYTEXT,
  SurfaceTemperature REAL,
  SpectralClass TINYTEXT,
  TypesOfEMSReleased TEXT,
  PRIMARY KEY (EMSinfoID)
);

CREATE TABLE BlackHoles (
  BlackHoleID INTEGER,
  BlackHoleName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (BlackHoleID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE InformationOfDiscovery (
  DiscoveryInfoID INTEGER,
  Discoverers TEXT,
  DateFirstObserved DATE,
  ProbeOrMachineryUsed TEXT,
  OrganizationsInvolved TEXT,
  PRIMARY KEY (DiscoveryInfoID)
);

CREATE TABLE LocationAndVisibility (
  LocationID INTEGER,
  Location TEXT,
  VisibilityStartDate DATE,
  VisibilityEndDate DATE,
  BestTimeToObserve TIME,
  PRIMARY KEY (LocationID)
);

CREATE TABLE Moons (
  MoonID INTEGER,
  MoonName TINYTEXT NOT NULL,
  PlanetID INTEGER,
  PRIMARY KEY (MoonID),
  FOREIGN KEY (PlanetID) REFERENCES Planets(PlanetID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Asteroids (
  AsteroidID INTEGER,
  AsteroidName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (AsteroidID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AstroObjectCategory (
  CategoryID INTEGER,
  CategoryName TINYTEXT NOT NULL,
  PRIMARY KEY (CategoryID)
);

CREATE TABLE ProbesAndSatellites (
  ProbeSatelliteID INTEGER,
  ProbeSatelliteName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (ProbeSatelliteID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SuperNovas (
  SuperNovaID INTEGER,
  SuperNovaName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (SuperNovaID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NeutronStars (
  NeutronStarID INTEGER,
  NeutronStarName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (NeutronStarID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DwarfPlanets (
  DwarfPlanetID INTEGER,
  DwarfPlanetName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (DwarfPlanetID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Comets (
  CometID INTEGER,
  CometName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (CometID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrbitalInformation (
  OrbitID INTEGER,
  OrbitName TINYTEXT NOT NULL,
  Eccentricity REAL,
  Perihelion REAL,
  Aphelion REAL,
  SemiMajor REAL,
  SemiMinor REAL,
  Foci REAL,
  PRIMARY KEY (OrbitID)
);

CREATE TABLE WhiteDwarfs (
  WhiteDwarfID INTEGER,
  WhiteDwarfName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (WhiteDwarfID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ChemicalComposition (
  CompositionID INTEGER,
  Composition TEXT,
  PossibilityOfLifeForms Boolean,
  PRIMARY KEY (CompositionID)
);

CREATE TABLE Nebulas (
  NebulaID INTEGER,
  NebulaName TINYTEXT NOT NULL,
  StarSystemID INTEGER,
  PRIMARY KEY (NebulaID),
  FOREIGN KEY (StarSystemID) REFERENCES StarSystems(StarSystemID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GeneralInformation (
  ObjectID INTEGER NOT NULL,
  CategoryID INTEGER NOT NULL,
  OrbitID INTEGER,
  LocationID INTEGER,
  DiscoveryInfoID INTEGER,
  CompositionID INTEGER,
  AttributeID INTEGER,
  EMSinfoID INTEGER,
  PRIMARY KEY (ObjectID, CategoryID),
  FOREIGN KEY (ObjectID) REFERENCES Planets(PlanetID),
  FOREIGN KEY (ObjectID) REFERENCES Asteroids(AsteroidID),
  FOREIGN KEY (CategoryID) REFERENCES AstroObjectCategory(CategoryID),
  FOREIGN KEY (ObjectID) REFERENCES BlackHoles(BlackHoleID),
  FOREIGN KEY (LocationID) REFERENCES LocationAndVisibility(LocationID),
  FOREIGN KEY (ObjectID) REFERENCES ProbesAndSatellites(ProbeSatelliteID),
  FOREIGN KEY (ObjectID) REFERENCES SuperNovas(SuperNovaID),
  FOREIGN KEY (ObjectID) REFERENCES Galaxies(GalaxyID),
  FOREIGN KEY (ObjectID) REFERENCES NeutronStars(NeutronStarID),
  FOREIGN KEY (ObjectID) REFERENCES StarSystems(StarSystemID),
  FOREIGN KEY (ObjectID) REFERENCES DwarfPlanets(DwarfPlanetID),
  FOREIGN KEY (ObjectID) REFERENCES Comets(CometID),
  FOREIGN KEY (EMSinfoID) REFERENCES EMSpectrumInformation(EMSinfoID),
  FOREIGN KEY (OrbitID) REFERENCES OrbitalInformation(OrbitID),
  FOREIGN KEY (AttributeID) REFERENCES PhysicalAttributes(AttributeID),
  FOREIGN KEY (ObjectID) REFERENCES WhiteDwarfs(WhiteDwarfID),
  FOREIGN KEY (DiscoveryInfoID) REFERENCES InformationOfDiscovery(DiscoveryInfoID),
  FOREIGN KEY (CompositionID) REFERENCES ChemicalComposition(CompositionID),
  FOREIGN KEY (ObjectID) REFERENCES Nebulas(NebulaID),
  FOREIGN KEY (ObjectID) REFERENCES Moons(MoonID)
);

-- .table
-- .schema



-- Object Tables
INSERT INTO Galaxies (GalaxyID, GalaxyName) VALUES (1, 'Milky Way') , (2, 'Andromeda'), (3, 'Cigar'), (4, 'Cartwheel');


INSERT INTO StarSystems (StarSystemID, StarSystemName, GalaxyID) 
VALUES ( 1 , 'Solar System' , 1 ) ,  
       ( 2 , 'Orion' , 1 ) ,   
       ( 3 , 'Sagittarius' , 1 ) ,  
       ( 4 , 'Ara' , 1 ) ;

INSERT INTO Planets (PlanetID, PlanetName, StarSystemID) 
VALUES ( 1 , 'Mercury' , 1 ) ,  
       ( 2 , 'Venus' , 1 ) ,   
       ( 3 , 'Earth' , 1 ) ,  
       ( 4 , 'Mars' , 1 ) ,
       ( 5 , 'Jupiter' , 1 ) ,
       ( 6 , 'Saturn' , 1 ) ,
       ( 7 , 'Uranus' , 1 ) ,
       ( 8 , 'Neptune' , 1 ) 
  ;

INSERT INTO Moons (MoonID, MoonName, PlanetID)
VALUES ( 1 , 'Moon' , 3 ) ,  
       ( 2 , 'Ganymede' , 5 ) ,   
       ( 3 , 'Callisto' , 5 ) ,  
       ( 4 , 'Titan' , 6 ) ;


INSERT INTO Asteroids (AsteroidID, AsteroidName, StarSystemID) VALUES ( 1 , '4 Vesta' , 1 ) ,  
       ( 2 , '433 Eros' , 1 ) ,   
       ( 3 , '243 Ida' , 1 ) ,  
       ( 4 , '16 Psyche' , 1 ) ;

INSERT INTO Comets (CometID, CometName, StarSystemID)
VALUES ( 1 , "Halley's Comet" , 1 ) ,  
       ( 2 , 'Tempel 1' , 1 ) ,   
       ( 3 , 'C/2022 E3 (ZTF)' , 1 ) ,  
       ( 4 , '2I/Borisov' , 1 ) ;

INSERT INTO ProbesAndSatellites (ProbeSatelliteID, ProbeSatelliteName, StarSystemID)
VALUES ( 1 , 'Pioneer 10' , 1 ) ,  
       ( 2 , 'New Horizons' , 1 ) ,   
       ( 3 , 'Voyager 1' , 1 ) ,  
       ( 4 , 'Juno' , 1 ) ;

INSERT INTO Nebulas (NebulaID, NebulaName, StarSystemID)
VALUES ( 1 , 'Verbin' , 3 ) ,  
       ( 2 , 'Eagle Eye' , 3 ) ,   
       ( 3 , 'Narrido' , 4) ,  
       ( 4 , 'Mendil' , 3) ;

INSERT INTO NeutronStars (NeutronStarID, NeutronStarName, StarSystemID)
VALUES ( 1 , 'Black Widow Pulsar' , 3 ) ,  
       ( 2 , 'PSR J0952-0607' , 2 ) ,   
       ( 3 , 'STD DU8D' , 3 ) ,  
       ( 4 , 'FHEI OE9' , 2) ;

INSERT INTO BlackHoles (BlackHoleID, BlackHoleName, StarSystemID)
VALUES ( 1 , 'Sagittarius A' , 3 ) ,  
       ( 2 , 'HFUIO 34 1L' , 4) ,   
       ( 3 , 'SFRIII 45' , 3 ) ,  
       ( 4 , 'FFHUI 90' , 2) ;

INSERT INTO SuperNovas (SuperNovaID, SuperNovaName, StarSystemID)
VALUES ( 1 , "Kepler's Supernova" , 3 ) ,  
       ( 2 , 'P455 B9' , 2 ) ,   
       ( 3 , '567 BNM I9' , 2 ) ,  
       ( 4 , 'SN1987A' , 2) ;

INSERT INTO WhiteDwarfs (WhiteDwarfID, WhiteDwarfName, StarSystemID)
VALUES ( 1 , 'Sirius B' , 4 ) ,  
       ( 2 , 'Procyon B' , 3) ,   
       ( 3 , 'S HG678' , 3 ) ,  
       ( 4 , 'Van Maneen' , 2) ;

INSERT INTO DwarfPlanets (DwarfPlanetID, DwarfPlanetName, StarSystemID)
VALUES ( 1 , 'Pluto' , 1 ) ,  
       ( 2 , 'Eris' , 3) ,   
       ( 3 , 'Ceres' , 4 ) ,  
       ( 4 , 'Haumea' , 2) ;




-- Info Tables
INSERT INTO AstroObjectCategory (CategoryID, CategoryName)
VALUES ( 1 , 'Galaxies') ,  
       ( 2 , 'Star Systems') ,   
       ( 3 , 'Planets') ,  
       ( 4 , 'Moons'),
       ( 5 , 'Asteroids'),
       ( 6 , 'Comets'),
       ( 7 , 'Probes and Satellites'),
       ( 8 , 'Neutron Stars'),
       ( 9 , 'Nebulas'),
       ( 10 , 'Black Holes'),
       ( 11 , 'Super Novas'),
       ( 12 , 'White Dwarfs'),
       ( 13 , 'Dwarf Planets')  
  ;

INSERT INTO OrbitalInformation (OrbitID, OrbitName, Eccentricity, Perihelion, Aphelion, SemiMajor, SemiMinor, Foci)
VALUES ( 3 , "Earth's Orbit" , 0.017 , 14700000000 , 152100000000, 149598023000 , 456733788 , 149600000000  ) ,  
       ( 1 , "Mercury's Orbit" , 0.045 , 158748787000 , 185749857000, 14476880 , 4520938788 , 14858700000  )  ;


INSERT INTO LocationAndVisibility (LocationID, Location, VisibilityStartDate, VisibilityEndDate, BestTimeToObserve)
VALUES ( 1 , "The first planet from the Sun " , '2023-01-01' , '2023-04-01', '21:30:00' ) ;

INSERT INTO InformationOfDiscovery (DiscoveryInfoID, Discoverers, DateFirstObserved, ProbeOrMachineryUsed, OrganizationsInvolved)
VALUES ( 1 , "Galileo Galilei and Thomas Harriot" , '1631-05-24' , 'Hand Telescopes', 'Individual Astronomers' )   ;

INSERT INTO ChemicalComposition (CompositionID, Composition, PossibilityOfLifeForms)
VALUES ( 1 , 'Mostly of oxygen, sodium, hydrogen, helium, and potassium, 70% metallic and 30% silicate material. 196Hg (0.15 percent), 198Hg (9.97 percent), 199Hg (16.87 percent), 200Hg (23.10 percent), 201Hg (13.18 percent), 202Hg (29.86 percent), and 204Hg (6.87 percent)' , 0 ) ;

INSERT INTO PhysicalAttributes (AttributeID, Mass, Diameter, Circumference, DistanceFromEarth, GravitationalForce, YearsOfLifeSpan)
VALUES ( 1 , 0330 , 4879 , 15329, 77000000, 3.7, 5000000000 )   ;

INSERT INTO EMSpectrumInformation (EMSInfoID, Luminosity, SurfaceColor, SurfaceTemperature, SpectralClass, TypesOfEMSReleased)
VALUES ( 1 , 1.45 , 'Dark Gray', 167, 'L' , 'Vsible Light, Infrared, Radio Waves' )   ;

INSERT INTO GeneralInformation (ObjectID, CategoryID, OrbitID, LocationID, DiscoveryInfoID, CompositionID, AttributeID, EMSInfoID)
VALUES ( 1 , 3 , 1 , 1, 1, 1, 1, 1)   ;



CREATE VIEW PlanetLocationAndVisibility AS 
  SELECT 
  P.PlanetName AS "Planet", 
  
  SS.StarSystemName AS "Star System", 
  
  G.GalaxyName AS "Galaxy", 
    
  LAV.Location AS "Relative Location", 
  LAV.VisibilityStartDate AS 'Visible From',
  LAV.VisibilityEndDate AS 'Visible Till',
  LAV.BestTimeToObserve AS 'Best Observable Time'

FROM Planets AS P
join GeneralInformation as GI on P.PlanetID = GI.ObjectID
join StarSystems as SS on P.StarSystemID = SS.StarSystemID
join Galaxies as G on SS.GalaxyID = G.GalaxyID
join LocationAndVisibility as LAV on GI.LocationID = LAV.LocationID;


-- case when s.FullOrNot = 1 then 'Yes'
--      else 'No'
-- end
--   as "Full?"

CREATE VIEW PlaneteryAndOrbitalAttributes AS 
  SELECT 
  P.PlanetName AS "Planet", 
   
  OI.Eccentricity AS "Eccentricity", 
  OI.Perihelion AS "Perihelion",
  OI.Aphelion AS "Aphelion", 
  OI.SemiMajor AS "SemiMajor Axis", 
  OI.SemiMinor AS "SemiMinor Axis", 
  OI.Foci AS "Foci Length", 

  PA.Mass AS "Mass (10^23kg)",
  PA.Diameter AS "Diameter (km)",
  PA.Circumference AS "Circumference (km)",
  PA.DistanceFromEarth AS "Distance From Earth (km)",
  PA.GravitationalForce AS "Gravitational Acceleration (ms^-1)",
  PA.YearsOfLifeSpan AS "Life Span (Years)"

FROM Planets AS P
join GeneralInformation as GI on P.PlanetID = GI.ObjectID
join OrbitalInformation as OI on GI.OrbitID = OI.OrbitID
join PhysicalAttributes as PA on PA.AttributeID = GI.AttributeID;

CREATE VIEW PlanetEMS AS 
  SELECT 
  P.PlanetName AS "Planet", 
   
  EMS.Luminosity AS "Luminosity", 
  EMS.SurfaceColor AS "Surface Color",
  EMS.SurfaceTemperature AS "Temperature", 
  EMS.SpectralClass AS "Object Class", 
  EMS.TypesOfEMSReleased AS "EMS",

  C.Composition AS "Composition",
  C.PossibilityOfLifeForms As "Life forms"

FROM Planets AS P
join GeneralInformation as GI on P.PlanetID = GI.ObjectID
join EMSpectrumInformation as EMS on GI.EMSInfoID = EMS.EMSInfoID join ChemicalComposition as C on C.CompositionID = GI.CompositionID
  ;

-- Select statements for tables 

-- SELECT * FROM Galaxies;
-- SELECT * FROM StarSystems;
-- SELECT * FROM Planets;
-- SELECT * FROM Moons;
-- SELECT * FROM Asteroids;
-- SELECT * FROM Comets;
-- SELECT * FROM ProbesAndSatellites;
-- SELECT * FROM NeutronStars; 
-- SELECT * FROM Nebulas;
-- SELECT * FROM BlackHoles;
-- SELECT * FROM SuperNovas;
-- SELECT * FROM WhiteDwarfs;
-- SELECT * FROM DwarfPlanets;
-- SELECT * FROM AstroObjectCategory;
-- SELECT * FROM OrbitalInformation;
-- SELECT * FROM LocationAndVisibility;
-- SELECT * FROM InformationOfDiscovery;
-- SELECT * FROM ChemicalComposition;
-- SELECT * FROM PhysicalAttributes;
-- SELECT * FROM EMSpectrumInformation;
-- SELECT * FROM GeneralInformation;

-- SELECT * FROM PlanetLocationAndVisibility;
-- SELECT * FROM PlaneteryAndOrbitalAttributes;
-- SELECT * FROM PlanetEMS;

