# Assignment 1

## Problem 1
PFAM is a database of domains. It also provides pre-calculated domains for all proteomes. The current
version can be found here ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes/. Each file
is a proteome identified by its taxonomic ID. Human has the ID 9606. Each of these files is tab-delimited
and the 6th column is the domain ID. Download the human proteome file using wget. After downloading
write just a single line of bash to find how many domain types (unique domains) are there in human genome.
You may use as many commands, chained in pipes, as you wish.

First, I made a directory to store the file using the following command
mkdir problem1
this made a 


```bash
pwd
```

    /media/sf_Gelare/scratch/linux_data/problem1



```bash
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes/9606.tsv.gz
```

    --2020-11-09 20:33:38--  ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes/9606.tsv.gz
               => ‘9606.tsv.gz’
    Resolving ftp.ebi.ac.uk (ftp.ebi.ac.uk)... 193.62.197.74
    Connecting to ftp.ebi.ac.uk (ftp.ebi.ac.uk)|193.62.197.74|:21... connected.
    Logging in as anonymous ... Logged in!
    ==> SYST ... done.    ==> PWD ... done.
    ==> TYPE I ... done.  ==> CWD (1) /pub/databases/Pfam/current_release/proteomes ... done.
    ==> SIZE 9606.tsv.gz ... 2487458
    ==> PASV ... done.    ==> RETR 9606.tsv.gz ... done.
    Length: 2487458 (2.4M) (unauthoritative)
    
    100%[======================================>] 2,487,458   1.14MB/s   in 2.1s   
    
    2020-11-09 20:33:42 (1.14 MB/s) - ‘9606.tsv.gz’ saved [2487458]
    



```bash
ls
```

    [0m[38;5;34m9606.tsv[0m  [38;5;34mindex.html[0m


6th column is domain, tab delinated, how many unique domains
in the 6th column, sort alphabetically, remove consecutive duplicates, count lines
should give the number of unique domains


```bash
cat 9606.tsv | cut -f6 | sort | uniq | wc -l
```

    6537


## Problem 2
On NCBI FTP site all the bacterial genomes are present in the directory ftp://ftp.ncbi.nlm.nih.gov/genom
es/archive/old_refseq/Bacteria/. There are hundreds of genomes in that directory. Using a single wget
command download proteomes corresponding to all the Yersinia_pestis strains. The proteomes should be
downloaded in such a way that each ".faa" files are inside separate directory. A ls should print something
like this:
Yersinia_pestis_A1122_uid158119/
Yersinia_pestis_Angola_uid58485/
Yersinia_pestis_Antiqua_uid58607/
Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/
Yersinia_pestis_biovar_Microtus_91001_uid58037/
Yersinia_pestis_CO92_uid57621/
Yersinia_pestis_D106004_uid158071/
Yersinia_pestis_D182038_uid158073/
Yersinia_pestis_KIM_10_uid57875/
Yersinia_pestis_Nepal516_uid58609/
Yersinia_pestis_Pestoides_F_uid58619/
Yersinia_pestis_Z176003_uid47317/


```bash
cd /media/sf_Gelare/scratch/linux_data/problem2
ls
pwd
```

    /media/sf_Gelare/scratch/linux_data/problem2



```bash
wget -r -A.faa -I /genomes/archive/old_refseq/Bacteria/Yersinia_pestis* \ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/
```

    --2020-11-10 20:19:28--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/.listing’
    Resolving ftp.ncbi.nlm.nih.gov (ftp.ncbi.nlm.nih.gov)... 130.14.250.13, 2607:f220:41e:250::7, 2607:f220:41e:250::10, ...
    Connecting to ftp.ncbi.nlm.nih.gov (ftp.ncbi.nlm.nih.gov)|130.14.250.13|:21... connected.
    Logging in as anonymous ... Logged in!
    ==> SYST ... done.    ==> PWD ... done.
    ==> TYPE I ... done.  ==> CWD (1) /genomes/archive/old_refseq/Bacteria ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [  <=>                                  ] 272,773      527KB/s   in 0.5s   
    
    2020-11-10 20:19:29 (527 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/.listing’ saved [272773]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/.listing’.
    Rejecting ‘AFLN00000000.1.11117.log’.
    Rejecting ‘AMHJ00000000.1.11222.log’.
    Rejecting ‘CLUSTERS’.
    Rejecting ‘ERR’.
    Rejecting ‘NZ_AAEK01000176’.
    Rejecting ‘ReadMe.txt’.
    Rejecting ‘SameSpecies.gi’.
    Rejecting ‘all.GeneMark.tar.gz’.
    Rejecting ‘all.Glimmer3.tar.gz’.
    Rejecting ‘all.Prodigal.tar.gz’.
    Rejecting ‘all.asn.tar.gz’.
    Rejecting ‘all.faa.tar.gz’.
    Rejecting ‘all.ffn.tar.gz’.
    Rejecting ‘all.fna.tar.gz’.
    Rejecting ‘all.frn.tar.gz’.
    Rejecting ‘all.gbk.tar.gz’.
    Rejecting ‘all.gff.tar.gz’.
    Rejecting ‘all.ptt.tar.gz’.
    Rejecting ‘all.rnt.tar.gz’.
    Rejecting ‘all.rpt.tar.gz’.
    Rejecting ‘all.val.tar.gz’.
    Rejecting ‘summary.txt’.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acaryochloris_marina_MBIC11017_uid58167’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_386B_uid214433’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_01_42C_uid158377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_01_uid59279’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_03_uid158373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_07_uid158381’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_12_uid158379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_22_uid158383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_26_uid158531’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacter_pasteurianus_IFO_3283_32_uid158375’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetobacterium_woodii_DSM_1030_uid88073’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acetohalobium_arabaticum_DSM_5501_uid51423’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acholeplasma_brassicae_uid222823’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acholeplasma_laidlawii_PG_8A_uid58901’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acholeplasma_palmae_J233_uid222824’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Achromobacter_xylosoxidans_A8_uid59899’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Achromobacter_xylosoxidans_NBRC_15126_uid232243’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Achromobacter_xylosoxidans_uid205255’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidaminococcus_fermentans_DSM_20731_uid43471’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidaminococcus_intestini_RyC_MR95_uid74445’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidianus_hospitalis_W1_uid66875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidilobus_saccharovorans_345_15_uid51395’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidimicrobidae_bacterium_YM16_304_uid193703’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidimicrobium_ferrooxidans_DSM_10331_uid59215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidiphilium_cryptum_JF_5_uid58447’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidiphilium_multivorum_AIU301_uid63345’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidithiobacillus_caldus_SM_1_uid70791’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidithiobacillus_ferrivorans_SS3_uid67387’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidithiobacillus_ferrooxidans_ATCC_23270_uid57649’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidithiobacillus_ferrooxidans_ATCC_53993_uid58613’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidobacterium_MP5ACTX9_uid50551’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidobacterium_capsulatum_ATCC_51196_uid59127’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidothermus_cellulolyticus_11B_uid58501’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidovorax_JS42_uid58427’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidovorax_KKS102_uid176500’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidovorax_avenae_ATCC_19860_uid42497’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidovorax_citrulli_AAC00_1_uid58429’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acidovorax_ebreus_TPSY_uid59233’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aciduliprofundum_MAR08_339_uid184407’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aciduliprofundum_boonei_T469_uid43333’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_ADP1_uid61597’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_1656_2_uid158677’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_AB0057_uid59083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_AB307_0294_uid59271’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_ACICU_uid58765’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_ATCC_17978_uid58731’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_AYE_uid61637’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_BJAB07104_uid210971’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_BJAB0715_uid210972’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_BJAB0868_uid210973’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_D1279779_uid190222’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_MDR_TJ_uid162739’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_MDR_ZJ06_uid158685’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_SDF_uid61601’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_TCDC_AB0715_uid158679’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_TYTH_1_uid176498’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_baumannii_ZW85_1_uid231518’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_calcoaceticus_PHEA_2_uid83123’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Acinetobacter_oleivorans_DR1_uid50119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinobacillus_pleuropneumoniae_serovar_3_JL03_uid58891’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinobacillus_pleuropneumoniae_serovar_5b_L20_uid58789’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinobacillus_pleuropneumoniae_serovar_7_AP76_uid59231’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinobacillus_succinogenes_130Z_uid58247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinobacillus_suis_H91_0380_uid176363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinoplanes_N902_109_uid202219’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinoplanes_SE50_110_uid162333’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinoplanes_friuliensis_DSM_7358_uid226110’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinoplanes_missouriensis_431_uid158169’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Actinosynnema_mirum_DSM_43827_uid58951’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Adlercreutzia_equolifaciens_DSM_19450_uid223286’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Advenella_kashmirensis_WT001_uid80859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aequorivita_sublithincola_DSM_14238_uid168181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aerococcus_urinae_ACS_120_V_Col10a_uid64757’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aeromonas_hydrophila_ATCC_7966_uid58617’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aeromonas_hydrophila_ML09_119_uid205540’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aeromonas_salmonicida_A449_uid58631’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aeromonas_veronii_B565_uid66323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aeropyrum_camini_SY1___JCM_12091_uid222311’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aeropyrum_pernix_K1_uid57757’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aggregatibacter_actinomycetemcomitans_ANH9381_uid80743’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aggregatibacter_actinomycetemcomitans_D11S_1_uid41333’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aggregatibacter_actinomycetemcomitans_D7S_1_uid46989’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aggregatibacter_aphrophilus_NJ8700_uid59407’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Agrobacterium_H13_3_uid63403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Agrobacterium_fabrum_C58_uid57865’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Agrobacterium_radiobacter_K84_uid58269’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Agrobacterium_vitis_S4_uid58249’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Agromonas_oligotrophica_S58_uid192186’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Akkermansia_muciniphila_ATCC_BAA_835_uid58985’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alcanivorax_borkumensis_SK2_uid58169’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alcanivorax_dieselolei_B5_uid176364’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alicycliphilus_denitrificans_BC_uid49953’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alicycliphilus_denitrificans_K601_uid66307’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alicyclobacillus_acidocaldarius_DSM_446_uid59199’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alicyclobacillus_acidocaldarius_Tc_4_1_uid158681’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aliivibrio_salmonicida_LFI1238_uid59251’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alistipes_finegoldii_DSM_17242_uid168180’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alistipes_shahii_WAL_8301_uid197175’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alkalilimnicola_ehrlichii_MLHE_1_uid58467’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alkaliphilus_metalliredigens_QYMF_uid58171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alkaliphilus_oremlandii_OhILAs_uid58495’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Allochromatium_vinosum_DSM_180_uid46083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_SN2_uid67349’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii_ATCC_27126_uid55253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii_AltDE1_uid179068’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Aegean_Sea_MED64__uid231689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Balearic_Sea_AD45__uid176366’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Black_Sea_11__uid176365’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Deep_ecotype__uid58251’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__English_Channel_615__uid210781’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__English_Channel_673__uid176367’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Ionian_Sea_U4__uid210780’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Ionian_Sea_U7__uid210785’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Ionian_Sea_U8__uid210782’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Ionian_Sea_UM4b__uid210784’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Alteromonas_macleodii__Ionian_Sea_UM7__uid210783’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aminobacterium_colombiense_DSM_12261_uid47083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ammonifex_degensii_KC4_uid41053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amphibacillus_xylanus_NBRC_15112_uid176453’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amycolatopsis_mediterranei_RB_uid216089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amycolatopsis_mediterranei_S699_uid158689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amycolatopsis_mediterranei_S699_uid171830’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amycolatopsis_mediterranei_U32_uid50565’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amycolatopsis_orientalis_HCCB10007_uid203791’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Amycolicicoccus_subflavus_DQS3_9A1_uid67253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anabaena_90_uid179383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anabaena_cylindrica_PCC_7122_uid183339’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anabaena_variabilis_ATCC_29413_uid58043’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaerobaculum_mobile_DSM_13181_uid168323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaerococcus_prevotii_DSM_20548_uid59219’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaerolinea_thermophila_UNI_1_uid62245’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaeromyxobacter_Fw109_5_uid58755’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaeromyxobacter_K_uid58953’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaeromyxobacter_dehalogenans_2CP_1_uid58989’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaeromyxobacter_dehalogenans_2CP_C_uid58135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_centrale_Israel_uid42155’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_marginale_Dawn_uid226994’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_marginale_Florida_uid58577’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_marginale_Gypsy_Plains_uid227217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_marginale_Maries_uid57629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_phagocytophilum_Dog2_uid213225’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_phagocytophilum_HZ2_uid213224’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_phagocytophilum_HZ_uid57951’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anaplasma_phagocytophilum_JM_uid213223’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Anoxybacillus_flavithermus_WK1_uid59135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aquifex_aeolicus_VF5_uid57765’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arcanobacterium_haemolyticum_DSM_20595_uid49489’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Archaeoglobus_fulgidus_DSM_4304_uid57717’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Archaeoglobus_profundus_DSM_5631_uid43493’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Archaeoglobus_sulfaticallidus_PM70_1_uid201033’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Archaeoglobus_veneficus_SNP6_uid65269’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arcobacter_L_uid158135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arcobacter_butzleri_7h1h_uid200766’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arcobacter_butzleri_ED_1_uid158699’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arcobacter_butzleri_RM4018_uid58557’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arcobacter_nitrofigilis_DSM_7299_uid49001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aromatoleum_aromaticum_EbN1_uid58231’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrobacter_FB24_uid58141’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrobacter_Rue61a_uid174511’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrobacter_arilaitensis_Re117_uid53509’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrobacter_aurescens_TC1_uid58109’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrobacter_chlorophenolicus_A6_uid58969’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrobacter_phenanthrenivorans_Sphe3_uid63629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Arthrospira_platensis_NIES_39_uid197171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Aster_yellows_witches_broom_phytoplasma_AYWB_uid58297’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Asticcacaulis_excentricus_CB_48_uid55641’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Atopobium_parvulum_DSM_20469_uid59195’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azoarcus_BH72_uid61603’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azoarcus_KH32C_uid193704’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azorhizobium_caulinodans_ORS_571_uid58905’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azospirillum_B510_uid46085’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azospirillum_brasilense_Sp245_uid162161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azospirillum_lipoferum_4B_uid82343’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azotobacter_vinelandii_CA6_uid198830’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azotobacter_vinelandii_CA_uid198829’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Azotobacter_vinelandii_DJ_uid57597’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_1NLA3E_uid81841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_JS_uid162189’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_CC178_uid226115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_DSM_7_uid53535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_FZB42_uid58271’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_IT_45_uid181617’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_LFB112_uid232246’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_LL3_uid158133’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_TA208_uid158701’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_XH7_uid158881’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_Y2_uid165195’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_AS43_3_uid183682’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_CAU_B946_uid84215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_NAU_B3_uid222816’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_UCMB5033_uid215237’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_UCMB5036_uid190705’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_UCMB5113_uid215236’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_amyloliquefaciens_plantarum_YAU_B9601_Y2_uid159001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis_A0248_uid59385’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis_A2012_uid54101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis_Ames_uid57909’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis_CDC_684_uid59303’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis_H9401_uid162021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis_Sterne_uid58091’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_anthracis__Ames_Ancestor__uid58083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_atrophaeus_1942_uid59887’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cellulosilyticus_DSM_2522_uid43329’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_03BB102_uid59299’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_AH187_uid58753’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_AH820_uid58751’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_ATCC_10987_uid57673’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_ATCC_14579_uid57975’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_B4264_uid58757’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_E33L_uid58103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_F837_76_uid83611’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_FRI_35_uid173403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_G9842_uid58759’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_NC7401_uid82815’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_Q1_uid58529’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cereus_biovar_anthracis_CI_uid50615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_clausii_KSM_K16_uid58237’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_coagulans_2_6_uid68053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_coagulans_36D1_uid54335’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_cytotoxicus_NVH_391_98_uid58317’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_halodurans_C_125_uid57791’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_infantis_NRRL_B_14911_uid222804’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_licheniformis_9945A_uid207072’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_licheniformis_ATCC_14580_uid58097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_licheniformis_DSM_13___ATCC_14580_uid58199’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_megaterium_DSM319_uid48371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_megaterium_QM_B1551_uid15862’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_megaterium_WSH_002_uid159841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_pseudofirmus_OF4_uid45847’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_pumilus_SAFR_032_uid59017’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_selenitireducens_MLS10_uid49513’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_168_uid57675’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_6051_HGW_uid193706’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_BAB_1_uid195461’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_BSP1_uid184010’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_BSn5_uid62463’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_PY79_uid229877’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_QB928_uid173926’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_RO_NN_1_uid158879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_XF_1_uid189187’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_natto_BEST195_uid183001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_spizizenii_TU_B_10_uid73967’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_subtilis_spizizenii_W23_uid51879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_Al_Hakam_uid58795’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_BMB171_uid49135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_Bt407_uid177931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_HD_771_uid173374’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_HD_789_uid173860’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_MC28_uid176369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_YBT_1518_uid229419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_serovar_IS5056_uid190186’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_serovar_chinensis_CT_43_uid158151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_serovar_finitimus_YBT_020_uid158875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_serovar_konkukian_97_27_uid58089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_thuringiensis_serovar_kurstaki_HD73_uid189188’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_toyonensis_BCT_7112_uid227218’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacillus_weihenstephanensis_KBAB4_uid58315’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteriovorax_marinus_SJ_uid82341’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_CF50_uid222805’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_fragilis_638R_uid84217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_fragilis_NCTC_9343_uid57639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_fragilis_YCH46_uid58195’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_helcogenes_P_36_108_uid62135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_salanitronis_DSM_18170_uid63269’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_thetaiotaomicron_VPI_5482_uid62913’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_uniformis_uid13130’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_vulgatus_ATCC_8482_uid58253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bacteroides_xylanisolvens_XB1A_uid197168’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_australis_Aust_NH1_uid189950’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_bacilliformis_KC583_uid58533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_clarridgeiae_73_uid62131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_grahamii_as4aup_uid59405’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_henselae_Houston_1_uid57745’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_quintana_RM_11_uid174512’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_quintana_Toulouse_uid57635’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_tribocorum_CIP_105476_uid59129’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bartonella_vinsonii_berkhoffii_Winnie_uid189951’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Baumannia_cicadellinicola_Hc__Homalodisca_coagulata__uid58111’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bdellovibrio_bacteriovorus_HD100_uid61595’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bdellovibrio_bacteriovorus_Tiberius_uid182482’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bdellovibrio_exovorus_JSS_uid194119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Beijerinckia_indica_ATCC_9039_uid59057’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Belliella_baltica_DSM_15883_uid168182’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Beutenbergia_cavernae_DSM_12333_uid59047’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bibersteinia_trehalosi_192_uid193709’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_adolescentis_ATCC_15703_uid58559’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_ATCC_25527_uid162513’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_AD011_uid58911’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_ATCC_27673_uid222803’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_B420_uid163691’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_BB_12_uid158871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_BLC1_uid158867’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_Bi_07_uid163693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_Bl12_uid210081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_Bl_04_uid59359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_CNCM_I_2494_uid158869’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_DSM_10140_uid59357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_animalis_lactis_V9_uid158865’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_asteroides_PRL2011_uid176921’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_bifidum_BGN4_uid167988’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_bifidum_PRL2010_uid59883’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_bifidum_S17_uid59545’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_breve_ACS_071_V_Sch8b_uid158863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_breve_UCC2003_uid193702’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_dentium_Bd1_uid43091’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_BBMN68_uid60163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_DJO10A_uid58833’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_F8_uid197184’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_JCM_1217_uid62695’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_JDM301_uid49131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_KACC_91563_uid158861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_NCC2705_uid57939’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_infantis_157F_uid62693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_infantis_ATCC_15697_uid159865’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_longum_infantis_ATCC_15697_uid58677’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bifidobacterium_thermophilum_RBL67_uid193770’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blastococcus_saxobsidens_DD2_uid89391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Blaberus_giganteus__uid165873’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Blatta_orientalis__Tarazona_uid188115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Blattella_germanica__Bge_uid41533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Cryptocercus_punctulatus__Cpu_uid81083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Mastotermes_darwiniensis__MADAR_uid77127’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Nauphoeta_cinerea__uid222815’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Panesthia_angustipennis_spadica__BPAA_uid193717’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Blattabacterium__Periplaneta_americana__BPLAN_uid41287’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_avium_197N_uid61563’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_bronchiseptica_253_uid178913’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_bronchiseptica_MO149_uid177517’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_bronchiseptica_RB50_uid57613’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_parapertussis_12822_uid57615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_parapertussis_18323_uid175569’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_parapertussis_Bpp5_uid177516’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_pertussis_CS_uid158859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_pertussis_Tohama_I_uid57617’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bordetella_petrii_uid61631’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_afzelii_HLJ01_uid177930’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_afzelii_PKo_uid159867’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_afzelii_PKo_uid58653’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_bissettii_DN127_uid71231’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_burgdorferi_B31_uid57581’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_burgdorferi_CA382_uid214794’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_burgdorferi_JD1_uid161197’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_burgdorferi_N40_uid161241’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_burgdorferi_ZS7_uid59429’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_crocidurae_Achema_uid162335’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_duttonii_Ly_uid58791’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_garinii_BgVir_uid162165’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_garinii_NMJW1_uid177081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_garinii_PBi_uid58125’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_hermsii_DAH_uid59225’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_miyamotoi_LB_2001_uid215233’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_recurrentis_A1_uid58793’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_turicatae_91E135_uid58311’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Borrelia_valaisiana_VS116_uid54823’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachybacterium_faecium_DSM_4810_uid58649’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_hyodysenteriae_WA1_uid59291’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_intermedia_PWS_A_uid158369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_murdochii_DSM_12563_uid48819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_pilosicoli_95_1000_uid50609’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_pilosicoli_B2904_uid175255’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_pilosicoli_P43_6_78_uid184077’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brachyspira_pilosicoli_WesB_uid175256’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bradyrhizobium_BTAi1_uid58505’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bradyrhizobium_ORS_278_uid58941’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bradyrhizobium_S23321_uid158167’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bradyrhizobium_japonicum_USDA_110_uid57599’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Bradyrhizobium_japonicum_USDA_6_uid158851’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brevibacillus_brevis_NBRC_100599_uid59175’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brevundimonas_subvibrioides_ATCC_15264_uid42117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_abortus_A13334_uid83615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_abortus_S19_uid58873’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_abortus_bv__1_9_941_uid58019’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_canis_ATCC_23365_uid59009’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_canis_HSK_A52141_uid83613’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_ceti_TE10759_12_uid229880’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_ceti_TE28753_12_uid229879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_melitensis_ATCC_23457_uid59241’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_melitensis_M28_uid158857’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_melitensis_M5_90_uid158855’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_melitensis_NI_uid158853’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_melitensis_biovar_Abortus_2308_uid62937’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_melitensis_bv__1_16M_uid57735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_microti_CCM_4915_uid59319’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_ovis_ATCC_25840_uid58113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_pinnipedialis_B2_94_uid71131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_suis_1330_uid159871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_suis_1330_uid57927’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_suis_ATCC_23445_uid59015’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Brucella_suis_VBI22_uid83617’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_5A__Acyrthosiphon_pisum__uid59285’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_APS__Acyrthosiphon_pisum__uid57805’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_Ak__Acyrthosiphon_kondoi__uid158533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_Bp__Baizongia_pistaciae__uid57827’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_Cc__Cinara_cedri__uid58579’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_JF98__Acyrthosiphon_pisum__uid158845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_JF99__Acyrthosiphon_pisum__uid158847’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_LL01__Acyrthosiphon_pisum__uid158843’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_Sg__Schizaphis_graminum__uid57913’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_TLW03__Acyrthosiphon_pisum__uid158849’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_Tuc7__Acyrthosiphon_pisum__uid59283’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola_Ua__Uroleucon_ambrosiae__uid158535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Buchnera_aphidicola__Cinara_tujafilina__uid68101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_383_uid58073’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_CCGE1001_uid42975’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_CCGE1002_uid42523’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_CCGE1003_uid46253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_KJ006_uid165871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_RPE64_uid205541’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_YI23_uid81081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_ambifaria_AMMD_uid58303’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_ambifaria_MC40_6_uid58701’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_cenocepacia_AU_1054_uid58371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_cenocepacia_HI2424_uid58369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_cenocepacia_J2315_uid57953’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_cenocepacia_MC0_3_uid58769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_cepacia_GG4_uid173858’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_gladioli_BSR3_uid66301’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_glumae_BGR1_uid59397’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_mallei_ATCC_23344_uid57725’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_mallei_NCTC_10229_uid58383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_mallei_NCTC_10247_uid58385’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_mallei_SAVP1_uid58387’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_multivorans_ATCC_17616_uid58697’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_multivorans_ATCC_17616_uid58909’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_phenoliruptrix_BR3459a_uid176370’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_phymatum_STM815_uid58699’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_phytofirmans_PsJN_uid58729’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_1026b_uid162511’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_1106a_uid58515’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_1710b_uid58391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_668_uid58389’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_BPC006_uid174460’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_K96243_uid57733’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_MSHR305_uid213227’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_MSHR346_uid55259’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_pseudomallei_NCTC_13179_uid226109’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_rhizoxinica_HKI_454_uid60487’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_thailandensis_E264_uid58081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_thailandensis_MSMB121_uid201037’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_vietnamiensis_G4_uid58075’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Burkholderia_xenovorans_LB400_uid57823’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Butyrivibrio_fibrisolvens_uid197155’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Butyrivibrio_proteoclasticus_B316_uid51489’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_bescii_DSM_6725_uid59201’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_hydrothermalis_108_uid60157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_kristjanssonii_177R1B_uid60393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_kronotskyensis_2002_uid60491’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_lactoaceticus_6A_uid60575’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_obsidiansis_OB47_uid51501’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_owensensis_OL_uid60165’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldicellulosiruptor_saccharolyticus_DSM_8903_uid58289’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldilinea_aerophila_DSM_14535___NBRC_104270_uid158165’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldisericum_exile_AZM16c01_uid158173’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldisphaera_lagunensis_DSM_15908_uid183486’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Calditerrivibrio_nitroreducens_DSM_19672_uid60821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caldivirga_maquilingensis_IC_167_uid58711’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Calothrix_PCC_6303_uid183109’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Calothrix_PCC_7507_uid182930’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_03_427_uid226993’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_coli_15_537360_uid226113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_coli_76339_uid217050’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_coli_CVM_N29710_uid219322’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_concisus_13826_uid58667’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_curvus_525_92_uid58669’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_fetus_82_40_uid58545’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_hominis_ATCC_BAA_381_uid58981’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_00_2425_uid219359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_00_2426_uid219324’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_00_2538_uid219325’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_00_2544_uid219326’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_4031_uid222817’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_81116_uid58771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_81_176_uid58503’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_IA3902_uid159531’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_ICDCCJ07001_uid61249’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_M1_uid159535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_NCTC_11168_BN148_uid174152’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_NCTC_11168___ATCC_700819_uid57587’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_PT14_uid176499’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_RM1221_uid57899’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_S3_uid159533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_jejuni_doylei_269_97_uid58671’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Campylobacter_lari_RM2100_uid58115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Accumulibacter_phosphatis_clade_IIA_UW_1_uid59207’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Amoebophilus_asiaticus_5a2_uid58963’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Arthromitus_SFB_mouse_Japan_uid71379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Arthromitus_SFB_mouse_Yit_uid159517’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Arthromitus_SFB_rat_Yit_uid73425’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Azobacteroides_pseudotrichonymphae_genomovar__CFP2_uid59163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Blochmannia_chromaiodes_640_uid185308’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Blochmannia_floridanus_uid57999’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Blochmannia_pennsylvanicus_BPEN_uid58329’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Blochmannia_vafer_BVAF_uid62083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Caldiarchaeum_subterraneum_uid227223’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_CE_isolate_Thao2000_uid172732’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_CS_isolate_Thao2000_uid172733’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_DC_uid213383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_HC_isolate_Thao2000_uid172734’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_HT_isolate_Thao2000_uid172735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_PC_isolate_NHV_uid172736’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Carsonella_ruddii_uid58773’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Chloracidobacterium_thermophilum_B_uid73587’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Cloacamonas_acidaminovorans_Evry_uid62959’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Desulforudis_audaxviator_MP104C_uid59067’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Hamiltonella_defensa_5AT__Acyrthosiphon_pisum__uid59289’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Hodgkinia_cicadicola_Dsem_uid59311’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_blastocrithidii_TCC012E_uid189752’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_blastocrithidii__ex_Strigomonas_culicis__uid183629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_crithidii_TCC036E_uid189749’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_crithidii__ex_Angomonas_deanei_ATCC_30255__uid183630’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_desouzaii_TCC079E_uid189750’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_galatii_TCC219_uid189751’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Kinetoplastibacterium_oncopeltii_TCC290E_uid189840’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Korarchaeum_cryptofilum_OPF8_uid58601’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Koribacter_versatilis_Ellin345_uid58479’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Liberibacter_americanus_Sao_Paulo_uid227424’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Liberibacter_asiaticus_gxpsy_uid193764’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Liberibacter_asiaticus_psy62_uid59227’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Liberibacter_solanacearum_CLso_ZC1_uid61245’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Methylomirabilis_oxyfera_uid161981’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Midichloria_mitochondrii_IricVA_uid68687’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Moranella_endobia_PCIT_uid68739’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Moranella_endobia_PCVAL_uid197215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Mycoplasma_haemolamae_Purdue_uid171259’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Mycoplasma_haemominutum__Birmingham_1__uid197195’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Nasuia_deltocephalinicola_NAS_ALF_uid214084’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Nitrosopumilus_AR2_uid176130’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Nitrosopumilus_koreensis_AR1_uid176129’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Nitrososphaera_gargensis_Ga9_2_uid176707’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Nitrospira_defluvii_uid51175’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Pelagibacter_IMCC9063_uid66305’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Pelagibacter_ubique_HTCC1062_uid58401’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Phytoplasma_australiense_uid61641’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Phytoplasma_mali_uid59087’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Phytoplasma_solani_284_09_uid225030’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Portiera_aleyrodidarum_BT_B_uid173859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Portiera_aleyrodidarum_BT_B_uid176373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Portiera_aleyrodidarum_BT_QVLC_uid175570’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Portiera_aleyrodidarum_BT_QVLC_uid176374’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Portiera_aleyrodidarum_TV_uid195460’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Protochlamydia_amoebophila_UWE25_uid58079’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Puniceispirillum_marinum_IMCC1322_uid47081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Rickettsia_amblyommii_GAT_30V_uid156845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Riesia_pediculicola_USDA_uid46841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Ruthia_magnifica_Cm__Calyptogena_magnifica__uid58645’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Saccharibacteria_bacterium_RAAC3_TM7_1_uid230715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Saccharobacterium_alaburgensis_uid203361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Solibacter_usitatus_Ellin6076_uid58139’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Sulcia_muelleri_CARI_uid52535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Sulcia_muelleri_DMIN_uid47075’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Sulcia_muelleri_GWSS_uid58943’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Sulcia_muelleri_SMDSEM_uid59393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Sulcia_muelleri_Sulcia_ALF_uid214083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Tremblaya_phenacola_PAVE_uid209173’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Tremblaya_princeps_PCIT_uid68741’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Tremblaya_princeps_PCVAL_uid159519’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Uzinura_diaspidicola_ASNER_uid186740’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Vesicomyosocius_okutanii_HA_uid59427’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Candidatus_Zinderia_insecticola_CARI_uid52459’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Capnocytophaga_canimorsus_Cc5_uid70727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Capnocytophaga_ochracea_DSM_7271_uid59197’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Carboxydothermus_hydrogenoformans_Z_2901_uid57821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cardinium_endosymbiont_cEper1_of_Encarsia_pergandiella_uid175524’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Carnobacterium_17_4_uid65789’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Carnobacterium_WN1359_uid225603’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Carnobacterium_maltaromaticum_LMA28_uid179370’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Catenulispora_acidiphila_DSM_44928_uid59077’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caulobacter_K31_uid58551’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caulobacter_crescentus_CB15_uid57891’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caulobacter_crescentus_NA1000_uid59307’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Caulobacter_segnis_ATCC_21756_uid41709’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cellulomonas_fimi_ATCC_484_uid66779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cellulomonas_flavigena_DSM_20109_uid48821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cellulophaga_algicola_DSM_14237_uid62159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cellulophaga_lytica_DSM_7489_uid63401’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cellvibrio_japonicus_Ueda107_uid59139’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cenarchaeum_symbiosum_A_uid61411’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chamaesiphon_minutus_PCC_6605_uid183005’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chelativorans_BNC1_uid58069’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chitinophaga_pinensis_DSM_2588_uid59113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_muridarum_Nigg_uid57785’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_pecorum_P787_uid221292’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_pecorum_PV3056_3_uid221290’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_pecorum_W73_uid221291’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_01DC12_uid179070’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_84_55_uid175571’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_CP3_uid175578’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_GR9_uid175572’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_M56_uid175576’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_MN_uid175573’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_NJ1_uid175579’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_VS225_uid175574’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_WC_uid175577’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_psittaci_WS_RT_E30_uid175575’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_434_Bu_uid61633’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_A2497_uid159863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_A2497_uid159993’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_A_363_uid196769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_A_5291_uid196770’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_A_7249_uid196771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_A_HAR_13_uid58333’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_B_Jali20_OT_uid59351’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_B_TZ1A828_OT_uid59349’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_C_TW_3_uid232251’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_D_EC_uid159881’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_D_LC_uid159879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_D_SotonD1_uid196772’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_D_SotonD5_uid196773’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_D_SotonD6_uid196774’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_D_UW_3_CX_uid57637’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_11023_uid161369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_150_uid161403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_Bour_uid196775’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_C599_uid222812’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_SW3_uid167483’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_SotonE4_uid196776’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_E_SotonE8_uid196777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_F_SW4_uid167484’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_F_SW5_uid167485’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_F_SWFPminus_uid222813’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_G_11074_uid161409’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_G_11222_uid161361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_G_9301_uid161377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_G_9768_uid161353’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_G_SotonG1_uid196779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_IU824_uid193712’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_IU888_uid193713’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_Ia_SotonIa1_uid196780’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_J_6276tet1_uid213394’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_K_SotonK1_uid196782’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L1_115_uid196784’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L1_224_uid196785’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L1_440_LN_uid196783’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2_25667R_uid196786’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2_434_Bu_f__uid198644’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2_434_Bu_i__uid198643’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_795_uid196791’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_8200_07_uid196787’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Ams1_uid196792’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Ams2_uid196793’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Ams3_uid196794’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Ams4_uid196795’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Ams5_uid196796’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_CV204_uid196790’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Canada1_uid196798’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_Canada2_uid196799’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_LST_uid196789’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_UCH_1_proctitis_uid61635’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2b_UCH_2_uid196788’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L2c_uid68843’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_L3_404_LN_uid196797’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_F_69_uid213385’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_F_s_342_uid213391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_F_s_852_uid213387’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_J_943_uid213388’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_J_953_uid213389’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_J_966_uid213393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_J_971_uid213395’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_J_s_122_uid213392’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_L2_55_uid213396’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_L2_s_3_uid213390’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_RC_L2_s_46_uid213386’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_Sweden2_uid161995’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_uid196778’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_uid196781’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydia_trachomatis_uid196800’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_abortus_S26_3_uid57963’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_caviae_GPIC_uid57783’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_felis_Fe_C_56_uid57971’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_pecorum_E58_uid66295’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_pneumoniae_AR39_uid57809’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_pneumoniae_CWL029_uid57811’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_pneumoniae_J138_uid57829’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_pneumoniae_LPCoLN_uid159529’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_pneumoniae_TW_183_uid57997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_01DC11_uid159527’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_02DC15_uid159521’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_08DC60_uid159525’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_6BC_uid159845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_6BC_uid63621’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_C19_98_uid159523’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_Mat116_uid189026’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlamydophila_psittaci_RD1_uid162063’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobaculum_parvum_NCIB_8327_uid59185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_chlorochromatii_CaD3_uid58375’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_limicola_DSM_245_uid58127’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_luteolum_DSM_273_uid58175’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_phaeobacteroides_BS1_uid58131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_phaeobacteroides_DSM_266_uid58133’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_phaeovibrioides_DSM_265_uid58129’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chlorobium_tepidum_TLS_uid57897’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chloroflexus_Y_400_fl_uid59085’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chloroflexus_aggregans_DSM_9485_uid58621’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chloroflexus_aurantiacus_J_10_fl_uid57657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chloroherpeton_thalassium_ATCC_35110_uid59187’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chromobacterium_violaceum_ATCC_12472_uid58001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chromohalobacter_salexigens_DSM_3043_uid62921’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chroococcidiopsis_thermalis_PCC_7203_uid183002’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Chthonomonas_calidirosea_T49_uid208678’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Citrobacter_koseri_ATCC_BAA_895_uid58143’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Citrobacter_rodentium_ICC168_uid43089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clavibacter_michiganensis_NCPPB_382_uid61625’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clavibacter_michiganensis_nebraskensis_NCPPB_2581_uid195908’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clavibacter_michiganensis_sepedonicus_uid61577’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridiales_genomosp__BVAB3_UPII9_5_uid46219’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_BNL1100_uid84307’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_SY8519_uid68705’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_acetobutylicum_ATCC_824_uid57677’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_acetobutylicum_DSM_1731_uid68293’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_acetobutylicum_EA_2018_uid159515’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_acidurici_9a_uid176126’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_autoethanogenum_DSM_10061_uid225029’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_beijerinckii_NCIMB_8052_uid58137’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_A2_Kyoto_uid59229’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_A3_Loch_Maree_uid59149’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_A_ATCC_19397_uid58927’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_A_ATCC_3502_uid61579’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_A_Hall_uid58931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_B1_Okra_uid59147’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_BKT015925_uid66203’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_B_Eklund_17B_uid59159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_Ba4_657_uid59173’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_E3_Alaska_E43_uid59157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_F_230613_uid159513’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_F_Langeland_uid58929’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_botulinum_H04402_065_uid162091’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_cellulolyticum_H10_uid58709’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_cellulovorans_743B_uid51503’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_cf__saccharolyticum_K10_uid197201’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_clariflavum_DSM_19732_uid82345’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_2007855_uid158365’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_630_uid57679’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_ATCC_43255_uid197173’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_BI1_uid158363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_CD196_uid41017’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_CF5_uid158359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_M120_uid158361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_M68_uid197172’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_difficile_R20291_uid40921’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_kluyveri_DSM_555_uid58885’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_kluyveri_NBRC_12016_uid59369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_lentocellum_DSM_5427_uid49117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_ljungdahlii_DSM_13528_uid50583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_novyi_NT_uid58643’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_pasteurianum_BC1_uid201478’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_perfringens_13_uid57681’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_perfringens_ATCC_13124_uid57901’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_perfringens_SM101_uid58117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_phytofermentans_ISDg_uid58519’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_saccharobutylicum_DSM_13864_uid223284’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_saccharolyticum_WM1_uid51419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_saccharoperbutylacetonicum_ATCC_27021_uid189747’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_stercorarium_DSM_8532_uid186819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_stercorarium_DSM_8532_uid195569’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_tetani_12124569_uid227214’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_tetani_E88_uid57683’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_thermocellum_ATCC_27405_uid57917’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Clostridium_thermocellum_DSM_1313_uid161989’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Collimonas_fungivorans_Ter331_uid70793’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Colwellia_psychrerythraea_34H_uid57855’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Comamonadaceae_bacterium_CR_uid223378’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Comamonas_testosteroni_CNB_2_uid62961’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Conexibacter_woesei_DSM_14684_uid43467’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coprococcus_ART55_1_uid197176’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coprococcus_catus_GD_7_uid197174’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coprothermobacter_proteolyticus_DSM_5265_uid59253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coraliomargarita_akajimensis_DSM_45221_uid47079’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corallococcus_coralloides_DSM_2259_uid157997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coriobacterium_glomerans_PW2_uid65787’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_argentoratense_DSM_44202_uid217419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_aurimucosum_ATCC_700975_uid59409’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_callunae_DSM_20147_uid193714’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_241_uid83607’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_31A_uid84309’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_BH8_uid84311’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_C7__beta__uid84313’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_CDCE_8392_uid84295’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_HC01_uid84297’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_HC02_uid84317’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_HC03_uid84299’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_HC04_uid84301’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_INCA_402_uid83605’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_NCTC_13129_uid57691’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_PW8_uid84303’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_diphtheriae_VA01_uid84305’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_efficiens_YS_314_uid62905’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_ATCC_13032_uid193708’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_ATCC_13032_uid57905’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_ATCC_13032_uid61611’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_MB001_uid214793’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_R_uid58897’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_SCgG1_uid207285’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_glutamicum_SCgG2_uid207286’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_halotolerans_YIM_70093___DSM_44683_uid189953’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_jeikeium_K411_uid58399’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_kroppenstedtii_DSM_44385_uid59411’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_maris_DSM_45190_uid214081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_1002_uid159677’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_1_06_A_uid159665’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_258_uid167260’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_267_uid162175’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_316_uid89381’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_31_uid162167’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_3_99_5_uid83609’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_42_02_A_uid159669’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_C231_uid159675’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_CIP_52_97_uid159667’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_Cp162_uid168258’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_FRC41_uid50585’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_I19_uid159673’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_P54B96_uid157909’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_pseudotuberculosis_PAT10_uid159671’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_resistens_DSM_45100_uid50555’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_terpenotabidum_Y_11_uid210639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_ulcerans_0102_uid169879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_ulcerans_809_uid159659’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_ulcerans_BR_AD22_uid68291’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_urealyticum_DSM_7109_uid61639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_urealyticum_DSM_7111_uid188688’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Corynebacterium_variabile_DSM_44702_uid62003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coxiella_burnetii_CbuG_Q212_uid58893’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coxiella_burnetii_CbuK_Q154_uid58895’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coxiella_burnetii_Dugway_5J108_111_uid58629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coxiella_burnetii_RSA_331_uid58637’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Coxiella_burnetii_RSA_493_uid57631’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Crinalium_epipsammum_PCC_9333_uid183113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Croceibacter_atlanticus_HTCC2559_uid49661’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cronobacter_sakazakii_45402_uid231516’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cronobacter_sakazakii_ATCC_BAA_894_uid58145’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cronobacter_sakazakii_ES15_uid167045’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cronobacter_sakazakii_Sp291_uid189241’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cronobacter_turicensis_z3032_uid40821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cryptobacterium_curtum_DSM_15641_uid59041’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cupriavidus_metallidurans_CH34_uid57815’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cupriavidus_necator_N_1_uid68689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cupriavidus_taiwanensis_LMG_19424_uid61615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanobacterium_aponinum_PCC_10605_uid183340’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanobacterium_stanieri_PCC_7202_uid183337’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanobium_gracile_PCC_6307_uid182931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanothece_ATCC_51142_uid59013’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanothece_PCC_7424_uid59025’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanothece_PCC_7425_uid59435’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanothece_PCC_7822_uid52547’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanothece_PCC_8801_uid59027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyanothece_PCC_8802_uid59143’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cyclobacterium_marinum_DSM_745_uid71485’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cycloclasticus_P1_uid176368’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cycloclasticus_zancles_7_ME_uid214092’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cylindrospermum_stagnale_PCC_7417_uid183111’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Cytophaga_hutchinsonii_ATCC_33406_uid57651’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dactylococcopsis_salina_PCC_8305_uid183341’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dechloromonas_aromatica_RCB_uid58025’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dechlorosoma_suillum_PS_uid81439’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deferribacter_desulfuricans_SSM1_uid46653’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalobacter_11DCA_uid177715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalobacter_CF_uid177714’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_BAV1_uid58477’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_CBDB1_uid58413’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_GT_uid42115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_VS_uid42393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_ethenogenes_195_uid57763’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_mccartyi_BTF08_uid190183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_mccartyi_DCMB5_uid190184’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalococcoides_mccartyi_GY50_uid230266’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dehalogenimonas_lykanthroporepellens_BL_DC_9_uid48131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_deserti_VCD115_uid58615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_geothermalis_DSM_11300_uid58275’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_gobiensis_I_0_uid162509’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_maricopensis_DSM_21211_uid62225’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_peraridilitoris_DSM_19664_uid183485’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_proteolyticus_MRP_uid63399’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Deinococcus_radiodurans_R1_uid57665’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Delftia_Cs1_4_uid67319’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Delftia_acidovorans_SPH_1_uid58703’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Denitrovibrio_acetiphilus_DSM_12809_uid46657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfarculus_baarsii_DSM_2075_uid51371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfatibacillum_alkenivorans_AK_01_uid58913’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfitobacterium_dehalogenans_ATCC_51507_uid82553’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfitobacterium_dichloroeliminans_LMG_P_21439_uid82555’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfitobacterium_hafniense_DCB_2_uid57749’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfitobacterium_hafniense_Y51_uid58605’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfobacca_acetoxidans_DSM_11109_uid65785’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfobacterium_autotrophicum_HRM2_uid59061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfobacula_toluolica_Tol2_uid175777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfobulbus_propionicus_DSM_2032_uid62265’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfocapsa_sulfexigens_DSM_10523_uid189952’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfococcus_oleovorans_Hxd3_uid58777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfohalobium_retbaense_DSM_5692_uid59183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfomicrobium_baculatum_DSM_4028_uid59217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfomonile_tiedjei_DSM_6799_uid168320’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfosporosinus_acidiphilus_SJ4_uid156759’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfosporosinus_meridiei_DSM_13257_uid75097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfosporosinus_orientis_DSM_765_uid82939’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotalea_psychrophila_LSv54_uid58153’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotomaculum_acetoxidans_DSM_771_uid59109’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotomaculum_carboxydivorans_CO_1_SRB_uid67317’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotomaculum_gibsoniae_DSM_7213_uid76945’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotomaculum_kuznetsovii_DSM_6115_uid67357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotomaculum_reducens_MI_1_uid58277’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfotomaculum_ruminis_DSM_2154_uid67507’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_aespoeensis_Aspo_2_uid42613’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_africanus_Walvis_Bay_uid66847’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_alaskensis_G20_uid57941’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_desulfuricans_ATCC_27774_uid59213’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_desulfuricans_ND132_uid63159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_gigas_DSM_1382_uid221293’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_hydrothermalis_AM13___DSM_14728_uid184831’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_magneticus_RS_1_uid59309’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_piezophilus_C1TLV30_uid190704’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_salexigens_DSM_2638_uid59223’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_vulgaris_DP4_uid58679’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_vulgaris_Hildenborough_uid57645’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_vulgaris_RCH1_uid161961’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfovibrio_vulgaris__Miyazaki_F__uid59089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfurispirillum_indicum_S5_uid45897’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfurivibrio_alkaliphilus_AHT2_uid49487’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfurobacterium_thermolithotrophum_DSM_11699_uid63405’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfurococcus_fermentans_DSM_16532_uid75119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfurococcus_kamchatkensis_1221n_uid59133’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Desulfurococcus_mucosus_DSM_2162_uid62227’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dichelobacter_nodosus_VCS1703A_uid57643’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dickeya_dadantii_3937_uid52537’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dickeya_dadantii_Ech586_uid42519’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dickeya_dadantii_Ech703_uid59363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dickeya_zeae_Ech1591_uid59297’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dictyoglomus_thermophilum_H_6_12_uid59439’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dictyoglomus_turgidum_DSM_6724_uid59177’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dinoroseobacter_shibae_DFL_12_uid58707’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Dyadobacter_fermentans_DSM_18053_uid59049’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Echinicola_vietnamensis_DSM_17526_uid184076’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ectothiorhodospiraceae_bacterium_M19_40_uid199898’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Edwardsiella_ictaluri_93_146_uid59403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Edwardsiella_tarda_C07_087_uid193773’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Edwardsiella_tarda_EIB202_uid41819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Edwardsiella_tarda_FL6_60_uid159657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eggerthella_YY7918_uid68707’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eggerthella_lenta_DSM_2243_uid59079’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ehrlichia_canis_Jake_uid58071’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ehrlichia_chaffeensis_Arkansas_uid57933’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ehrlichia_muris_AS145_uid232250’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ehrlichia_ruminantium_Gardel_uid58245’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ehrlichia_ruminantium_Welgevonden_uid58013’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ehrlichia_ruminantium_Welgevonden_uid58243’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Elusimicrobium_minutum_Pei191_uid58949’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Emticicia_oligotrophica_DSM_17448_uid177079’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_638_uid58727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_R4_368_uid208672’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_aerogenes_EA1509E_uid187411’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_aerogenes_KCTC_2190_uid68103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_asburiae_LF7a_uid72793’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_cloacae_ATCC_13047_uid48363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_cloacae_ENHKU01_uid172463’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_cloacae_EcWSU1_uid80739’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_cloacae_NCTC_9394_uid197202’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_cloacae_SCF1_uid59969’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacter_cloacae_dissolvens_SDM_uid168997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterobacteriaceae_bacterium_FGI_57_uid185181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_7L76_uid197170’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_casseliflavus_EC20_uid55693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecalis_62_uid159663’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecalis_D32_uid171261’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecalis_OG1RF_uid54927’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecalis_Symbioflor_1_uid183342’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecalis_V583_uid57669’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecium_Aus0004_uid87025’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecium_Aus0085_uid214432’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecium_DO_uid55353’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_faecium_NRRL_B_2354_uid188477’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_hirae_ATCC_9790_uid70619’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Enterococcus_mundtii_QU_25_uid229420’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_Ejp617_uid159955’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_amylovora_ATCC_49946_uid46943’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_amylovora_CFBP1430_uid46839’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_billingiae_Eb661_uid50547’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_pyrifoliae_DSM_12163_uid159693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_pyrifoliae_Ep1_96_uid40659’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erwinia_tasmaniensis_Et1_99_uid59029’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erysipelothrix_rhusiopathiae_Fujisawa_uid68021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erysipelothrix_rhusiopathiae_SY1027_uid206518’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Erythrobacter_litoralis_HTCC2594_uid58299’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_blattae_DSM_4481_uid165043’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_042_uid161985’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_536_uid58531’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_55989_uid59383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_ABU_83972_uid161975’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_APEC_O1_uid58623’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_APEC_O78_uid187277’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_ATCC_8739_uid58783’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_BL21_DE3__uid161947’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_BL21_DE3__uid161949’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_BW2952_uid59391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_B_REL606_uid58803’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_CFT073_uid57915’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_DH1_uid161951’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_DH1_uid162051’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_E24377A_uid58395’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_ED1a_uid59379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_ETEC_H10407_uid161993’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_HS_uid58393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_IAI1_uid59377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_IAI39_uid59381’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_IHE3034_uid162007’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_JJ1886_uid226103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_KO11FL_uid162099’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_KO11FL_uid52593’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__DH10B_uid58979’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MDS42_uid193705’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__W3110_uid161931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_LF82_uid161965’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_LY180_uid219461’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_NA114_uid162139’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O103_H2_12009_uid41013’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O104_H4_2009EL_2050_uid175905’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O104_H4_2009EL_2071_uid176128’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O104_H4_2011C_3493_uid176127’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O111_H__11128_uid41023’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O127_H6_E2348_69_uid59343’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O157_H7_EC4115_uid59091’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O157_H7_EDL933_uid57831’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O157_H7_TW14359_uid59235’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O157_H7_uid57781’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O26_H11_11368_uid41021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O55_H7_CB9615_uid46655’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O55_H7_RM12579_uid162153’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O7_K1_CE10_uid162115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_O83_H1_NRG_857C_uid161987’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_P12b_uid162061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_PMV_1_uid219679’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_S88_uid62979’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_SE11_uid59425’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_SE15_uid161939’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_SMS_3_5_uid58919’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_UM146_uid162043’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_UMN026_uid62981’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_UMNK88_uid161991’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_UTI89_uid58541’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_W_uid162011’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_W_uid162101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli_Xuzhou21_uid163995’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli__BL21_Gold_DE3_pLysS_AG__uid59245’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli__clone_D_i14__uid162049’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_coli__clone_D_i2__uid162047’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Escherichia_fergusonii_ATCC_35469_uid59375’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ethanoligenens_harbinense_YUAN_3_uid46255’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_cylindroides_T2_87_uid197177’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_eligens_ATCC_27750_uid59171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_limosum_KIST612_uid59777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_rectale_ATCC_33656_uid59169’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_rectale_uid197161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_rectale_uid197162’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_siraeum_V10Sc8a_uid197178’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Eubacterium_siraeum_uid197160’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Exiguobacterium_AT1b_uid59093’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Exiguobacterium_MH3_uid227425’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Exiguobacterium_antarcticum_B7_uid176125’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Exiguobacterium_sibiricum_255_15_uid58053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Faecalibacterium_prausnitzii_L2_6_uid197183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Faecalibacterium_prausnitzii_uid197157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ferrimonas_balearica_DSM_9799_uid53371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ferroglobus_placidus_DSM_10642_uid40863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ferroplasma_acidarmanus_fer1_uid54095’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fervidicoccus_fontis_Kam940_uid162201’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fervidobacterium_nodosum_Rt17_B1_uid58625’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fervidobacterium_pennivorans_DSM_9078_uid78143’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fibrella_aestuarina_uid178352’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fibrobacter_succinogenes_S85_uid161919’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fibrobacter_succinogenes_S85_uid41169’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Filifactor_alocis_ATCC_35896_uid46625’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Finegoldia_magna_ATCC_29328_uid58867’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacteriaceae_bacterium_3519_10_uid59413’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacteriales_bacterium_HTCC2170_uid51877’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacterium_branchiophilum_FL_15_uid73421’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacterium_columnare_ATCC_49512_uid80731’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacterium_indicum_GPTSA100_9_uid157999’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacterium_johnsoniae_UW101_uid58493’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flavobacterium_psychrophilum_JIP02_86_uid61627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flexibacter_litoralis_DSM_6794_uid168257’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Flexistipes_sinusarabici_DSM_4947_uid68147’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fluviicola_taffensis_DSM_16823_uid65271’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_TX077308_uid68321’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_cf__novicida_3523_uid162107’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_cf__novicida_Fx1_uid162105’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_noatunensis_orientalis_LADL_07_285A_uid231515’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_noatunensis_orientalis_Toba_04_uid164779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_novicida_U112_uid58499’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_philomiragia_ATCC_25017_uid59105’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_FSC198_uid58693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_NE061598_uid161973’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_SCHU_S4_uid57589’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_TI0902_uid89373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_TIGB03_uid89379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_WY96_3418_uid58811’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_holarctica_F92_uid181998’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_holarctica_FSC200_uid54341’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_holarctica_FTNF002_00_uid58999’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_holarctica_LVS_uid58595’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_holarctica_OSU18_uid58687’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Francisella_tularensis_mediasiatica_FSC147_uid58939’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Frankia_CcI3_uid58397’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Frankia_EAN1pec_uid58367’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Frankia_EuI1c_uid42615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Frankia_alni_ACN14a_uid58695’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Frankia_symbiont_of_Datisca_glomerata_uid46257’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Frateuria_aurantia_DSM_6220_uid81775’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fusobacterium_3_1_36A2_uid55995’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fusobacterium_4_8_uid205051’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fusobacterium_nucleatum_ATCC_25586_uid57885’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Fusobacterium_nucleatum_polymorphum_ATCC_10953_uid54419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gallibacterium_anatis_UMN179_uid66567’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gallionella_capsiferriformans_ES_2_uid51505’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gardnerella_vaginalis_409_05_uid43211’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gardnerella_vaginalis_ATCC_14019_uid55487’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gardnerella_vaginalis_HMP9231_uid162045’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geitlerinema_PCC_7407_uid183007’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gemmatimonas_aurantiaca_T_27_uid58813’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_C56_T3_uid49467’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_HH01_uid188479’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_JF8_uid215234’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_WCH70_uid59045’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_Y412MC52_uid55381’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_Y412MC61_uid41171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_Y4_1MC1_uid55779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_kaustophilus_HTA426_uid58227’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_thermodenitrificans_NG80_2_uid58829’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_thermoglucosidasius_C56_YS93_uid48129’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacillus_thermoleovorans_CCB_US3_UF5_uid82949’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_FRC_32_uid58543’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_M18_uid55771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_M21_uid59037’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_bemidjiensis_Bem_uid58749’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_lovleyi_SZ_uid58713’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_metallireducens_GS_15_uid57731’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_sulfurreducens_KN400_uid161977’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_sulfurreducens_PCA_uid57743’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geobacter_uraniireducens_Rf4_uid58475’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Geodermatophilus_obscurus_DSM_43160_uid43725’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Glaciecola_4H_3_7_YE_5_uid66595’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Glaciecola_nitratireducens_FR1064_uid73759’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Glaciecola_psychrophila_170_uid193711’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gloeobacter_JS_uid225602’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gloeobacter_violaceus_PCC_7421_uid58011’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gloeocapsa_PCC_7428_uid183112’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gluconacetobacter_diazotrophicus_PAl_5_uid59075’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gluconacetobacter_diazotrophicus_PAl_5_uid61587’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gluconacetobacter_xylinus_NBRC_3288_uid46523’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gluconobacter_oxydans_621H_uid58239’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gluconobacter_oxydans_H24_uid179202’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gordonia_KTR9_uid174812’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gordonia_bronchialis_DSM_43247_uid41403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gordonia_polyisoprenivorans_VH2_uid86651’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gordonibacter_pamelaeae_7_10_1_b_uid197167’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Gramella_forsetii_KT0803_uid58881’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Granulibacter_bethesdensis_CGDNIH1_uid58661’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Granulicella_mallensis_MP5ACTX8_uid49957’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_ducreyi_35000HP_uid57625’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_10810_uid86647’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_86_028NP_uid58093’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_F3031_uid62123’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_F3047_uid62097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_KR494_uid219323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_PittEE_uid58591’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_PittGG_uid58593’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_R2846_uid161921’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_R2866_uid161923’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_influenzae_Rd_KW20_uid57771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_parainfluenzae_T3T1_uid72801’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_parasuis_SH0165_uid59273’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_parasuis_ZJ0906_uid209117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_somnus_129PT_uid57929’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haemophilus_somnus_2336_uid57979’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hahella_chejuensis_KCTC_2396_uid58483’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halalkalicoccus_jeotgali_B3_uid50305’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halanaerobium_hydrogeniformans_uid60191’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halanaerobium_praevalens_DSM_2228_uid161959’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haliangium_ochraceum_DSM_14365_uid41425’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haliscomenobacter_hydrossis_DSM_1100_uid66777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloarcula_hispanica_ATCC_33960_uid72475’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloarcula_hispanica_N601_uid230920’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloarcula_marismortui_ATCC_43049_uid57719’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halobacillus_halophilus_DSM_2266_uid162033’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halobacterium_NRC_1_uid57769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halobacterium_salinarum_R1_uid61571’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halobacteroides_halobius_DSM_5150_uid184862’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloferax_mediterranei_ATCC_33500_uid167315’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloferax_volcanii_DS2_uid46845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halogeometricum_borinquense_DSM_11551_uid54919’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halomicrobium_mukohataei_DSM_12286_uid59107’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halomonas_elongata_DSM_2581_uid52781’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halopiger_xanaduensis_SH_6_uid68105’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloquadratum_walsbyi_C23_uid162019’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloquadratum_walsbyi_DSM_16790_uid58673’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halorhabdus_tiamatea_SARL4B_uid214082’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halorhabdus_utahensis_DSM_12940_uid59189’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halorhodospira_halophila_SL1_uid58473’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halorubrum_lacusprofundi_ATCC_49239_uid58807’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Haloterrigena_turkmenica_DSM_5511_uid43501’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halothece_PCC_7418_uid183338’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halothermothrix_orenii_H_168_uid58585’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halothiobacillus_neapolitanus_c2_uid41317’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halovivax_ruber_XH_70_uid184819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Halyomorpha_halys_symbiont_uid222821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_acinonychis_Sheeba_uid58685’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_bizzozeronii_CIII_1_uid68141’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_cetorum_MIT_00_7128_uid162217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_cetorum_MIT_99_5656_uid162215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_cinaedi_ATCC_BAA_847_uid193765’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_cinaedi_PAGU611_uid162219’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_felis_ATCC_49179_uid61409’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_heilmannii_ASB1_4_uid182935’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_hepaticus_ATCC_51449_uid57737’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_mustelae_12198_uid46647’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_2017_uid161151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_2018_uid161159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_26695_uid178201’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_26695_uid57787’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_35A_uid49903’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_51_uid161925’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_83_uid161153’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_908_uid159985’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Aklavik117_uid182201’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Aklavik86_uid182202’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_B38_uid59415’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_B8_uid49873’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_BM012A_uid229744’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_BM012S_uid229881’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Cuz20_uid159987’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_ELS37_uid158157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_F16_uid161145’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_F30_uid159991’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_F32_uid161139’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_F57_uid161143’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_G27_uid59305’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Gambia94_24_uid159493’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_HPAG1_uid58517’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_HUP_B14_uid162213’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_India7_uid161149’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_J99_uid57789’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Lithuania75_uid159491’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_OK113_uid193715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_OK310_uid193716’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_P12_uid59327’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_PeCan18_uid162211’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_PeCan4_uid53539’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Puno120_uid159611’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Puno135_uid161157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Rif1_uid178202’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Rif2_uid178203’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_SJM180_uid53541’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_SNT49_uid159615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Sat464_uid159467’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Shi112_uid162207’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Shi169_uid162209’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Shi417_uid162205’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_Shi470_uid59165’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_SouthAfrica20_uid216150’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_SouthAfrica7_uid159989’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_UM032_uid203025’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_UM037_uid203027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_UM066_uid203028’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_UM298_uid213226’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_UM299_uid203026’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_XZ274_uid165869’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_uid159983’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Helicobacter_pylori_v225d_uid159639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Heliobacterium_modesticaldum_Ice1_uid58279’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Herbaspirillum_seropedicae_SmR1_uid50427’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Herminiimonas_arsenicoxydans_uid58291’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Herpetosiphon_aurantiacus_DSM_785_uid58599’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hippea_maritima_DSM_10411_uid65267’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hirschia_baltica_ATCC_49814_uid59365’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hydrogenobacter_thermophilus_TK_6_uid159875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hydrogenobacter_thermophilus_TK_6_uid45927’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hydrogenobaculum_HO_uid190882’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hydrogenobaculum_SN_uid46251’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hydrogenobaculum_Y04AAS1_uid58857’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hyperthermus_butylicus_DSM_5456_uid57755’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hyphomicrobium_MC1_uid68453’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hyphomicrobium_denitrificans_1NES1_uid179904’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hyphomicrobium_denitrificans_ATCC_51888_uid50325’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hyphomicrobium_nitrativorans_NL23_uid230615’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Hyphomonas_neptunium_ATCC_15444_uid58433’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Idiomarina_loihiensis_GSL_199_uid205256’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Idiomarina_loihiensis_L2TR_uid58087’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ignavibacterium_album_JCM_16511_uid162097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ignicoccus_hospitalis_KIN4_I_uid58365’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ignisphaera_aggregans_DSM_17230_uid51875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ilyobacter_polytropus_DSM_2926_uid59769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Intrasporangium_calvum_DSM_43043_uid61729’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Isoptericola_variabilis_225_uid67501’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Isosphaera_pallida_ATCC_43644_uid62207’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Jannaschia_CCS1_uid58147’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Janthinobacterium_Marseille_uid58603’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Jonesia_denitrificans_DSM_20603_uid59053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kangiella_koreensis_DSM_16069_uid59209’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ketogulonicigenium_vulgare_WSH_001_uid161161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ketogulonicigenium_vulgare_Y25_uid59581’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kineococcus_radiotolerans_SRS30216_uid58067’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kitasatospora_setae_KM_6054_uid77027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_oxytoca_E718_uid170256’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_oxytoca_KCTC_1686_uid83159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_1084_uid174151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_342_uid59145’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_CG43_uid223021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_HS11286_uid84387’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_JM45_uid215235’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_KCTC_2242_uid162147’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_MGH_78578_uid57619’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_NTUH_K2044_uid59073’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_pneumoniae_rhinoscleromatis_SB3432_uid203334’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Klebsiella_variicola_At_22_uid42113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kocuria_rhizophila_DC2201_uid59099’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kosmotoga_olearia_TBF_19_5_1_uid59205’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kribbella_flavida_DSM_17836_uid43465’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Krokinobacter_4H_3_7_5_uid66593’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kyrpidia_tusciae_DSM_2912_uid48361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Kytococcus_sedentarius_DSM_20547_uid59071’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lacinutrix_5H_3_7_4_uid68067’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_acidophilus_30SC_uid63605’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_acidophilus_La_14_uid201479’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_acidophilus_NCFM_uid57685’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_amylovorus_GRL1118_uid160233’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_amylovorus_GRL_1112_uid61179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_brevis_ATCC_367_uid57989’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_brevis_KB290_uid195560’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_buchneri_NRRL_B_30929_uid66205’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_buchneri_uid73657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_ATCC_334_uid57985’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_BD_II_uid162119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_BL23_uid59237’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_LC2W_uid162121’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_LOCK919_uid210959’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_W56_uid178736’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_casei_Zhang_uid50673’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_crispatus_ST1_uid48359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_delbrueckii_bulgaricus_2038_uid161929’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_delbrueckii_bulgaricus_ATCC_11842_uid58647’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_delbrueckii_bulgaricus_ATCC_BAA_365_uid57987’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_delbrueckii_bulgaricus_ND02_uid60621’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_fermentum_CECT_5716_uid162003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_fermentum_F6_uid203391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_fermentum_IFO_3956_uid58865’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_gasseri_ATCC_33323_uid57687’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_helveticus_CNRZ32_uid212302’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_helveticus_DPC_4571_uid58761’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_helveticus_H10_uid162017’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_helveticus_R0052_uid174439’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_johnsonii_DPC_6026_uid162057’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_johnsonii_FI9785_uid41735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_johnsonii_N6_2_uid229876’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_johnsonii_NCC_533_uid58029’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_kefiranofaciens_ZW3_uid67985’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_paracasei_8700_2_uid55295’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_plantarum_16_uid209042’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_plantarum_JDM1_uid59361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_plantarum_P8_uid203333’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_plantarum_ST_III_uid53537’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_plantarum_WCFS1_uid62911’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_plantarum_ZJ316_uid188689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_reuteri_DSM_20016_uid58471’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_reuteri_I5007_uid208677’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_reuteri_JCM_1112_uid58875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_reuteri_SD2112_uid55357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_reuteri_TD1_uid213089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_rhamnosus_ATCC_8530_uid162169’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_rhamnosus_GG_uid161983’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_rhamnosus_GG_uid59313’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_rhamnosus_LOCK900_uid210957’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_rhamnosus_LOCK908_uid210958’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_rhamnosus_Lc_705_uid59315’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_ruminis_ATCC_27782_uid73417’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_sakei_23K_uid58281’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_salivarius_CECT_5713_uid162005’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_salivarius_UCC118_uid58233’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactobacillus_sanfranciscensis_TMW_1_1304_uid72937’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_garvieae_ATCC_49156_uid73413’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_garvieae_Lg2_uid161935’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_CV56_uid160253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_IO_1_uid192185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_Il1403_uid57671’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_KF147_uid42831’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_KLDS_4_0325_uid225028’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_cremoris_A76_uid160937’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_cremoris_KW2_uid219629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_cremoris_MG1363_uid58837’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_cremoris_NZ9000_uid167481’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_cremoris_SK11_uid57983’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lactococcus_lactis_cremoris_UC509_9_uid179384’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Laribacter_hongkongensis_HLHK9_uid59265’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lawsonia_intracellularis_N343_uid186598’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lawsonia_intracellularis_PHE_MN1_00_uid61575’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leadbetterella_byssophila_DSM_17132_uid60161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_longbeachae_NSW150_uid46099’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_2300_99_Alcoy_uid48801’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_ATCC_43290_uid86885’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Corby_uid58733’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Hextuple_2q_uid197191’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Hextuple_3a_uid197192’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_LPE509_uid193710’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Lens_uid58209’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Lorraine_uid170535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Paris_uid58211’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Philadelphia_1_uid57609’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_Thunder_Bay_uid206517’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Legionella_pneumophila_uid170534’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leifsonia_xyli_CTCB07_uid57759’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leifsonia_xyli_cynodontis_DSM_46306_uid221294’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leisingera_methylohalidivorans_DSM_14336_uid232356’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptolyngbya_PCC_7376_uid182928’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_biflexa_serovar_Patoc__Patoc_1__Ames__uid58511’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_biflexa_serovar_Patoc__Patoc_1__Paris__uid58993’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_borgpetersenii_serovar_Hardjo_bovis_JB197_uid58509’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_borgpetersenii_serovar_Hardjo_bovis_L550_uid58507’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_interrogans_serovar_Copenhageni_Fiocruz_L1_130_uid58065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_interrogans_serovar_Lai_56601_uid57881’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospira_interrogans_serovar_Lai_IPAV_uid161957’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospirillum_ferriphilum_ML_04_uid175904’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptospirillum_ferrooxidans_C2_3_uid158171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptothrix_cholodnii_SP_6_uid58971’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leptotrichia_buccalis_C_1013_b_uid59211’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_C2_uid68743’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_carnosum_JB16_uid176371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_citreum_KM20_uid58481’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_gasicomitatum_LMG_18811_uid50385’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_gelidum_JB7_uid175682’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_kimchii_IMSNU_11154_uid48589’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_mesenteroides_ATCC_8293_uid57919’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Leuconostoc_mesenteroides_J18_uid84337’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_innocua_Clip11262_uid61567’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_ivanovii_PAM_55_uid73473’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_07PF0776_uid162185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_08_5923_uid43727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_10403S_uid54461’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_ATCC_19117_uid175109’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_Clip80459_uid59317’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_EGD_e_uid61583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_EGD_uid223288’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_FSL_R2_561_uid54441’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_Finland_1998_uid54443’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_HCC23_uid59203’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_J0161_uid54459’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_J1816_uid179734’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_J1_220_uid179735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_L312_uid175768’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_La111_uid193768’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_M7_uid162131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_N53_1_uid193767’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_SLCC2376_uid175111’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_SLCC2378_uid175105’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_SLCC2479_uid175108’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_SLCC2540_uid175106’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_SLCC5850_uid175110’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_SLCC7179_uid175107’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_serotype_1_2b_SLCC2755_uid52455’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_serotype_1_2c_SLCC2372_uid174872’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_serotype_4a_L99_uid161953’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_serotype_4b_F2365_uid57689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_serotype_4b_LL195_uid182103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_serotype_7_SLCC2482_uid174871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_monocytogenes_uid43671’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_seeligeri_serovar_1_2b_SLCC3954_uid46215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listeria_welshimeri_serovar_6b_SLCC5334_uid61605’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Listonella_anguillarum_M3_uid217771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Lysinibacillus_sphaericus_C3_41_uid58945’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Macrococcus_caseolyticus_JCSC5402_uid59003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Magnetococcus_MC_1_uid57833’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Magnetospirillum_gryphiswaldense_MSR_1_uid232249’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Magnetospirillum_magneticum_AMB_1_uid58527’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mahella_australiensis_50_1_BON_uid66917’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_D153_uid212303’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_D171_uid212304’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_D174_uid212305’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_M42548_uid198769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_USDA_ARS_SAM_185_uid195457’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_USDA_ARS_USMARC_183_uid195458’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_haemolytica_USMARC_2286_uid213228’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mannheimia_succiniciproducens_MBEL55E_uid58197’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Maricaulis_maris_MCS10_uid58689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinithermus_hydrothermalis_DSM_14884_uid65783’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinitoga_piezophila_KA3_uid81629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinobacter_BSs20148_uid171995’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinobacter_adhaerens_HP15_uid162009’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinobacter_aquaeolei_VT8_uid59419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinobacter_hydrocarbonoclasticus_ATCC_49840_uid162203’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinomonas_MWYL1_uid58715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinomonas_mediterranea_MMB_1_uid64753’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marinomonas_posidonica_IVIA_Po_181_uid67323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Marivirga_tractuosa_DSM_4126_uid60837’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Megamonas_hypermegale_uid197163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Megasphaera_elsdenii_DSM_20460_uid71135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Meiothermus_ruber_DSM_1279_uid198526’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Meiothermus_ruber_DSM_1279_uid46661’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Meiothermus_silvanus_DSM_9946_uid49485’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Melioribacter_roseus_P3M_uid170941’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Melissococcus_plutonius_ATCC_35311_uid66803’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Melissococcus_plutonius_DAT561_uid89371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesoplasma_florum_L1_uid58055’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesoplasma_florum_W37_uid224253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesorhizobium_australicum_WSM2073_uid75101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesorhizobium_ciceri_biovar_biserrulae_WSM1271_uid62101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesorhizobium_loti_MAFF303099_uid57601’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesorhizobium_opportunistum_WSM2075_uid40861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mesotoga_prima_MesG1_Ag_4_2_uid52599’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Metallosphaera_cuprina_Ar_4_uid66329’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Metallosphaera_sedula_DSM_5348_uid58717’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanobacterium_AL_21_uid63623’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanobacterium_MB1_uid231690’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanobacterium_SWAN_1_uid67359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanobrevibacter_AbM4_uid206516’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanobrevibacter_ruminantium_M1_uid45857’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanobrevibacter_smithii_ATCC_35061_uid58827’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocaldococcus_FS406_22_uid42499’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocaldococcus_fervens_AG86_uid59347’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocaldococcus_infernus_ME_uid48803’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocaldococcus_jannaschii_DSM_2661_uid57713’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocaldococcus_vulcanius_M7_uid41131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocella_arvoryzae_MRE50_uid61623’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocella_conradii_HZ254_uid157911’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocella_paludicola_SANAE_uid42887’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcoides_burtonii_DSM_6242_uid58023’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_aeolicus_Nankai_3_uid58823’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_maripaludis_C5_uid58741’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_maripaludis_C6_uid58947’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_maripaludis_C7_uid58847’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_maripaludis_S2_uid58035’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_maripaludis_X1_uid70729’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_vannielii_SB_uid58767’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanococcus_voltae_A3_uid49529’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanocorpusculum_labreanum_Z_uid58785’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanoculleus_bourgensis_MS2_uid171377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanoculleus_marisnigri_JR1_uid58561’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanohalobium_evestigatum_Z_7303_uid49857’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanohalophilus_mahii_DSM_5219_uid47313’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanolobus_psychrophilus_R15_uid177925’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanomassiliicoccus_Mx1_Issoire_uid207287’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanomethylovorans_hollandica_DSM_15978_uid184864’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanoplanus_petrolearius_DSM_11571_uid52695’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanopyrus_kandleri_AV19_uid57883’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanoregula_boonei_6A8_uid58815’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanoregula_formicicum_SMSP_uid184406’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosaeta_concilii_GP6_uid66207’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosaeta_harundinacea_6Ac_uid81199’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosaeta_thermophila_PT_uid58469’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosalsum_zhilinae_DSM_4017_uid68249’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosarcina_acetivorans_C2A_uid57879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosarcina_barkeri_Fusaro_uid57715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosarcina_mazei_Go1_uid57893’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosarcina_mazei_Tuc01_uid190185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosphaera_stadtmanae_DSM_3091_uid58407’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanosphaerula_palustris_E1_9c_uid59193’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanospirillum_hungatei_JF_1_uid58181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanothermobacter_marburgensis_Marburg_uid51637’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanothermobacter_thermautotrophicus_Delta_H_uid57877’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanothermococcus_okinawensis_IH1_uid51535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanothermus_fervidus_DSM_2088_uid60167’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methanotorris_igneus_Kol_5_uid67321’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylacidiphilum_infernorum_V4_uid59161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylibium_petroleiphilum_PM1_uid58085’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacillus_flagellatus_KT_uid58049’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_4_46_uid58843’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_chloromethanicum_CM4_uid58933’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_extorquens_AM1_uid57605’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_extorquens_DM4_uid61617’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_extorquens_PA1_uid58821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_nodulans_ORS_2060_uid59023’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_populi_BJ001_uid58937’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylobacterium_radiotolerans_JCM_2831_uid58845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylocella_silvestris_BL2_uid59433’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylococcus_capsulatus_Bath_uid57607’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylocystis_SC2_uid174072’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylomicrobium_alcaliphilum_uid77119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylomonas_methanica_MC09_uid67363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylophaga_JAM1_uid162947’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylophaga_JAM7_uid162949’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylotenera_301_uid49469’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylotenera_mobilis_JLW8_uid59373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylovorus_MP688_uid60723’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Methylovorus_glucosetrophus_SIP3_4_uid59367’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Micavibrio_EPB_uid194120’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Micavibrio_aeruginosavorus_ARL_13_uid73585’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Microbacterium_testaceum_StLB037_uid62789’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Micrococcus_luteus_NCTC_2665_uid59033’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Microcoleus_PCC_7113_uid183114’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Microcystis_aeruginosa_NIES_843_uid59101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Microlunatus_phosphovorus_NM_1_uid68055’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Micromonospora_L5_uid45895’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Micromonospora_aurantiaca_ATCC_27029_uid42501’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mobiluncus_curtisii_ATCC_43063_uid49695’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Modestobacter_marinus_uid167487’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Moorella_thermoacetica_ATCC_39073_uid58051’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Moraxella_catarrhalis_BBH18_uid48809’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Morganella_morganii_KT_uid180867’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Muricauda_ruestringensis_DSM_13258_uid72479’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_JDM601_uid67369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_JLS_uid58489’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_KMS_uid58491’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_MCS_uid58465’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_MOTT36Y_uid164001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_VKM_Ac_1815D_uid199859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_abscessus_bolletii_50594_uid205422’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_abscessus_uid61613’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_africanum_GM041182_uid68839’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_avium_104_uid57693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_avium_paratuberculosis_K_10_uid57699’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_avium_paratuberculosis_MAP4_uid202426’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_bovis_AF2122_97_uid57695’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_bovis_BCG_Korea_1168P_uid189029’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_bovis_BCG_Mexico_uid86889’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_bovis_BCG_Pasteur_1173P2_uid58781’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_bovis_BCG_Tokyo_172_uid59281’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_canettii_CIPT_140010059_uid70731’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_canettii_CIPT_140060008_uid184829’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_canettii_CIPT_140070008_uid184832’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_canettii_CIPT_140070010_uid184828’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_canettii_CIPT_140070017_uid184830’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_chubuense_NBB4_uid168322’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_gilvum_PYR_GCK_uid59421’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_gilvum_Spyr1_uid61403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_indicus_pranii_MTCC_9506_uid175523’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_intracellulare_ATCC_13950_uid167994’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_intracellulare_MOTT_02_uid89387’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_intracellulare_MOTT_64_uid89385’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_kansasii_ATCC_12478_uid55385’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_leprae_Br4923_uid59293’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_leprae_TN_uid57697’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_liflandii_128FXT_uid59005’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_marinum_M_uid59423’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_massiliense_GO_06_uid170732’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_rhodesiae_NBB3_uid75107’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_smegmatis_JS623_uid184820’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_smegmatis_MC2_155_uid171958’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_smegmatis_MC2_155_uid57701’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_Beijing_NITR203_uid197218’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_CAS_NITR204_uid202217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_CCDC5079_uid161943’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_CCDC5079_uid203790’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_CCDC5180_uid161941’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_CDC1551_uid57775’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_CTRI_2_uid161997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_EAI5_NITR206_uid202218’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_EAI5_uid212307’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_Erdman___ATCC_35801_uid193763’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_F11_uid58417’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_H37Ra_uid58853’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_H37Rv_uid170532’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_H37Rv_uid57777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_Haarlem3_NITR202_uid202216’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_Haarlem_uid54453’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_KZN_1435_uid59069’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_KZN_4207_uid83619’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_KZN_605_uid54947’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_RGTB327_uid157907’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_RGTB423_uid162179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_UT205_uid162183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_tuberculosis_uid185758’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_ulcerans_Agy99_uid62939’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_vanbaalenii_PYR_1_uid58463’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycobacterium_yongonense_05_1390_uid189649’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_agalactiae_PG2_uid61619’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_agalactiae_uid46679’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_arthritidis_158L3_1_uid58005’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_bovis_HB0801_uid168665’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_bovis_Hubei_1_uid68691’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_bovis_PG45_uid60859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_capricolum_ATCC_27343_uid58525’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_conjunctivae_uid59325’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_crocodyli_MP145_uid47087’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_cynos_C142_uid184824’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_fermentans_JER_uid53543’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_fermentans_M64_uid62099’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_fermentans_PG18_uid197154’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_CA06_2006_052_5_2P_uid172630’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_F_uid162001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_NC06_2006_080_5_2P_uid172629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_NC08_2008_031_4_3P_uid172631’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_NC95_13295_2_2P_uid172625’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_NC96_1596_4_2P_uid172626’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_NY01_2001_047_5_1P_uid172627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_R_high__uid161999’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_R_low__uid57993’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_S6_uid200523’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_VA94_7994_1_7P_uid172624’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_gallisepticum_WI01_2001_043_13_2P_uid172628’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_genitalium_G37_uid57707’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_genitalium_M2288_uid173372’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_genitalium_M2321_uid173373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_genitalium_M6282_uid173371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_genitalium_M6320_uid173370’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_haemocanis_Illinois_uid82367’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_haemofelis_Langford_1_uid62461’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_haemofelis_Ohio2_uid162029’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hominis_ATCC_23114_uid41875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyopneumoniae_168_L_uid205052’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyopneumoniae_168_uid162053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyopneumoniae_232_uid58205’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyopneumoniae_7422_uid212968’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyopneumoniae_7448_uid58039’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyopneumoniae_J_uid58059’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyorhinis_DBS_1050_uid228933’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyorhinis_GDL_1_uid87003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyorhinis_HUB_1_uid51695’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyorhinis_MCLD_uid162087’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_hyorhinis_SK76_uid181997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_leachii_99_014_6_uid162031’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_leachii_PG50_uid60849’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_mobile_163K_uid58077’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_mycoides_SC_Gladysdale_uid197153’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_mycoides_SC_PG1_uid58031’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_mycoides_capri_LC_95010_uid66189’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_ovis_Michigan_uid232247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_parvum_Indiana_uid223379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_penetrans_HF_2_uid57729’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_pneumoniae_309_uid85495’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_pneumoniae_FH_uid162027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_pneumoniae_M129_B7_uid185759’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_pneumoniae_M129_uid57709’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_pulmonis_UAB_CTIP_uid61569’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_putrefaciens_KS1_uid72481’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_putrefaciens_Mput9231_uid198525’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_suis_Illinois_uid61897’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_suis_KI3806_uid63665’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_synoviae_53_uid58061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Mycoplasma_wenyonii_Massachusetts_uid170731’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Myxococcus_fulvus_HW_1_uid68443’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Myxococcus_stipitatus_DSM_14675_uid186549’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Myxococcus_xanthus_DK_1622_uid58003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nakamurella_multipartita_DSM_44233_uid59221’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nanoarchaeum_equitans_Kin4_M_uid58009’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natranaerobius_thermophilus_JW_NM_WN_LF_uid59001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natrialba_magadii_ATCC_43099_uid46245’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natrinema_J7_uid171337’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natrinema_pellirubrum_DSM_15624_uid74437’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natronobacterium_gregoryi_SP2_uid74439’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natronococcus_occultus_SP4_uid184863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natronomonas_moolapensis_8_8_11_uid190182’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Natronomonas_pharaonis_DSM_2160_uid58435’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nautilia_profundicola_AmH_uid59345’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_gonorrhoeae_FA_1090_uid57611’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_gonorrhoeae_NCCP11945_uid59191’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_gonorrhoeae_TCDC_NG08107_uid161097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_lactamica_020_06_uid60851’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_053442_uid58587’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_8013_uid161967’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_FAM18_uid57825’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_G2136_uid162085’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_H44_76_uid162083’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_M01_240149_uid162079’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_M01_240355_uid162075’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_M04_240196_uid162081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_MC58_uid57817’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_NZ_05_33_uid162077’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_WUE_2594_uid162093’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_Z2491_uid57819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_alpha14_uid61649’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neisseria_meningitidis_alpha710_uid161971’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neorickettsia_risticii_Illinois_uid58889’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Neorickettsia_sennetsu_Miyayama_uid57965’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Niastella_koreensis_GR20_10_uid83125’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitratifractor_salsuginis_DSM_16511_uid62183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitratiruptor_SB155_2_uid58861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrobacter_hamburgensis_X14_uid58293’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrobacter_winogradskyi_Nb_255_uid58295’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosococcus_halophilus_Nc4_uid46803’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosococcus_oceani_ATCC_19707_uid58403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosococcus_watsonii_C_113_uid50331’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosomonas_AL212_uid55727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosomonas_Is79A3_uid68745’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosomonas_europaea_ATCC_19718_uid57647’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosomonas_eutropha_C91_uid58363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosopumilus_maritimus_SCM1_uid58903’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nitrosospira_multiformis_ATCC_25196_uid58361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nocardia_brasiliensis_ATCC_700358_uid86913’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nocardia_cyriacigeorgica_GUH_2_uid89395’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nocardia_farcinica_IFM_10152_uid58203’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nocardioides_JS614_uid58149’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nocardiopsis_alba_ATCC_BAA_2165_uid174334’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nocardiopsis_dassonvillei_DSM_43111_uid49483’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nostoc_PCC_7107_uid182932’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nostoc_PCC_7120_uid57803’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nostoc_PCC_7524_uid182933’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Nostoc_punctiforme_PCC_73102_uid57767’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Novosphingobium_PP1Y_uid67383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Novosphingobium_aromaticivorans_DSM_12444_uid57747’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oceanimonas_GK1_uid81627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oceanithermus_profundus_DSM_14977_uid60855’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oceanobacillus_iheyensis_HTE831_uid57867’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ochrobactrum_anthropi_ATCC_49188_uid58921’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Octadecabacter_antarcticus_307_uid54701’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Octadecabacter_arcticus_238_uid54699’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Odoribacter_splanchnicus_DSM_20712_uid63397’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oenococcus_oeni_PSU_1_uid59417’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oligotropha_carboxidovorans_OM4_uid162135’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oligotropha_carboxidovorans_OM5_uid59155’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oligotropha_carboxidovorans_OM5_uid72795’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Olsenella_uli_DSM_7084_uid51367’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Onion_yellows_phytoplasma_OY_M_uid58015’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Opitutus_terrae_PB90_1_uid58965’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Orientia_tsutsugamushi_Boryong_uid61621’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Orientia_tsutsugamushi_Ikeda_uid58869’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ornithobacterium_rhinotracheale_DSM_15997_uid168256’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oscillatoria_acuminata_PCC_6304_uid183003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oscillatoria_nigro_viridis_PCC_7112_uid183110’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Oscillibacter_valericigenes_Sjm18_20_uid73895’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Owenweeksia_hongkongensis_DSM_17368_uid82951’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_JDR_2_uid59021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_Y412MC10_uid41127’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_larvae_04_309_uid232355’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_mucilaginosus_3016_uid89377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_mucilaginosus_K02_uid162117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_mucilaginosus_KNP414_uid68311’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_polymyxa_CR1_uid231659’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_polymyxa_E681_uid53477’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_polymyxa_M1_uid162159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_polymyxa_SC2_uid59583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paenibacillus_terrae_HPL_003_uid82371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paludibacter_propionicigenes_WB4_uid60725’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pandoraea_RB_44_uid231151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pandoraea_pnomenusa_3kgm_uid229878’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pantoea_At_9b_uid55845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pantoea_ananatis_AJ13355_uid162073’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pantoea_ananatis_LMG_20103_uid46807’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pantoea_ananatis_PA13_uid162181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pantoea_ananatis_uid86861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pantoea_vagans_C9_1_uid49871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Parabacteroides_distasonis_ATCC_8503_uid58301’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Parachlamydia_acanthamoebae_UV7_uid68335’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paracoccus_aminophilus_JCM_7686_uid214795’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Paracoccus_denitrificans_PD1222_uid58187’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Parvibaculum_lavamentivorans_DS_1_uid58739’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Parvularcula_bermudensis_HTCC2503_uid51641’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pasteurella_multocida_3480_uid161955’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pasteurella_multocida_36950_uid86887’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pasteurella_multocida_HN06_uid156881’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pasteurella_multocida_Pm70_uid57627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pectobacterium_SCC3193_uid193707’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pectobacterium_atrosepticum_SCRI1043_uid57957’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pectobacterium_carotovorum_PC1_uid59295’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pectobacterium_carotovorum_PCC21_uid174335’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pectobacterium_wasabiae_WPP163_uid41297’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pediococcus_claussenii_ATCC_BAA_344_uid81103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pediococcus_pentosaceus_ATCC_25745_uid57981’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pediococcus_pentosaceus_SL4_uid227215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pedobacter_heparinus_DSM_2366_uid59111’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pedobacter_saltans_DSM_12145_uid61349’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pelagibacterium_halotolerans_B2_uid74393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pelobacter_carbinolicus_DSM_2380_uid58241’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pelobacter_propionicus_DSM_2379_uid58255’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pelodictyon_phaeoclathratiforme_BU_1_uid58173’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pelotomaculum_thermopropionicum_SI_uid58877’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Persephonella_marina_EX_H1_uid58119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Persicivirga_dokdonensis_DSW_6_uid186842’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Petrotoga_mobilis_SJ95_uid58747’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Phaeobacter_gallaeciensis_DSM_17395_uid54717’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Phaeobacter_gallaeciensis_DSM_26640_uid232357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Phaeobacter_gallaeciensis_uid54715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Phenylobacterium_zucineum_HLK1_uid58959’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Photobacterium_profundum_SS9_uid62923’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Photorhabdus_asymbiotica_ATCC_43949_uid59243’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Photorhabdus_luminescens_laumondii_TTO1_uid61593’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Phycisphaera_mikurensis_NBRC_102666_uid157331’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Picrophilus_torridus_DSM_9790_uid58041’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pirellula_staleyi_DSM_6068_uid43209’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Planctomyces_brasiliensis_DSM_5305_uid60583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Planctomyces_limnophilus_DSM_3776_uid48643’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Plautia_stali_symbiont_uid65033’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pleurocapsa_PCC_7327_uid183006’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Polaribacter_MED152_uid54207’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Polaromonas_JS666_uid58207’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Polaromonas_naphthalenivorans_CJ2_uid58273’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Polymorphum_gilvum_SL003B_26A1_uid65447’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Polynucleobacter_necessarius_STIR1_uid58967’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Polynucleobacter_necessarius_asymbioticus_QLW_P1DMWA_1_uid58611’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Porphyromonas_asaccharolytica_DSM_20707_uid66603’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Porphyromonas_gingivalis_ATCC_33277_uid58879’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Porphyromonas_gingivalis_TDC60_uid67407’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Porphyromonas_gingivalis_W83_uid57641’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prevotella_dentalis_DSM_3688_uid184818’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prevotella_denticola_F0289_uid65091’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prevotella_intermedia_17_uid163151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prevotella_melaninogenica_ATCC_25845_uid51377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prevotella_oral_taxon_299_F0039_uid45899’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prevotella_ruminicola_23_uid47507’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_AS9601_uid58307’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_CCMP1375_uid57995’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9211_uid58309’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9215_uid58819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9301_uid58437’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9303_uid58305’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9312_uid58357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9313_uid57773’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_MIT_9515_uid58313’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_NATL1A_uid58423’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_NATL2A_uid58359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prochlorococcus_marinus_pastoris_CCMP1986_uid57761’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acidipropionici_ATCC_4875_uid179069’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_266_uid162059’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_6609_uid162137’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_ATCC_11828_uid162177’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_C1_uid176501’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_HL096PA1_uid198524’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_KPA171202_uid58101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_SK137_uid48071’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_TypeIA2_P_acn17_uid80735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_TypeIA2_P_acn31_uid80733’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_acnes_TypeIA2_P_acn33_uid80745’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_avidum_44067_uid197361’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_freudenreichii_shermanii_CIRM_BIA1_uid49535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Propionibacterium_propionicum_F0230a_uid170533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Prosthecochloris_aestuarii_DSM_271_uid58151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Proteus_mirabilis_BB2000_uid214430’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Proteus_mirabilis_HI4320_uid61599’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Providencia_stuartii_MRSN_2154_uid162193’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudanabaena_PCC_7367_uid183004’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudoalteromonas_SM9913_uid61247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudoalteromonas_atlantica_T6c_uid58283’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudoalteromonas_haloplanktis_TAC125_uid58431’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudogulbenkiania_NH8B_uid73423’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_ND6_uid167583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_TKP_uid232248’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_VLB120_uid226717’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_B136_33_uid196598’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_DK2_uid168996’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_LES431_uid232245’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_LESB58_uid59275’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_M18_uid162089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_MTB_uid231150’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_NCGM2_S1_uid162173’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PA1R_uid228932’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PA1_uid228931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PA7_uid58627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PAO1_VE13_uid225027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PAO1_VE2_uid225026’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PAO1_uid57945’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_PAO581_uid219357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_RP73_uid209328’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_SCV20265_uid232358’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_UCBPP_PA14_uid57977’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_aeruginosa_c7447m_uid219358’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_brassicacearum_NFM421_uid66303’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_denitrificans_ATCC_13867_uid195459’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_entomophila_L48_uid58639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_A506_uid165185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_CHA0_uid203393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_F113_uid87037’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_Pf0_1_uid57591’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_Pf_5_uid57937’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_R124_uid182045’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fluorescens_SBW25_uid158693’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_fulva_12_X_uid67351’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_mendocina_NK_01_uid66299’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_mendocina_ymp_uid58723’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_monteilii_SB3078_uid232252’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_monteilii_SB3101_uid232253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_poae_RE_1_1_14_uid188480’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_BIRD_1_uid162055’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_DOT_T1E_uid171260’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_F1_uid58355’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_GB_1_uid58735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_H8234_uid208673’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_HB3267_uid184078’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_KT2440_uid57843’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_NBRC_14164_uid208670’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_S16_uid68747’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_UW4_uid182733’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_putida_W619_uid58651’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_resinovorans_NBRC_106553_uid208671’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_stutzeri_A1501_uid58641’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_stutzeri_ATCC_17588___LMG_11199_uid68749’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_stutzeri_CCUG_29243_uid168379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_stutzeri_DSM_10701_uid170940’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_stutzeri_DSM_4166_uid162113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_stutzeri_RCH2_uid184342’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_syringae_B728a_uid57931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_syringae_phaseolicola_1448A_uid58099’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudomonas_syringae_tomato_DC3000_uid57967’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudonocardia_dioxanivorans_CB1190_uid65087’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudovibrio_FO_BEG1_uid82373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudoxanthomonas_spadix_BD_a59_uid75113’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pseudoxanthomonas_suwonensis_11_1_uid62105’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychrobacter_G_uid210641’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychrobacter_PRwf_1_uid58459’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychrobacter_arcticus_273_4_uid58021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychrobacter_cryohalolentis_K5_uid58373’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychroflexus_torquis_ATCC_700755_uid54205’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychromonas_CNPT3_uid54249’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Psychromonas_ingrahamii_37_uid58521’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pusillimonas_T7_7_uid66391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_1860_uid82379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_aerophilum_IM2_uid57727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_arsenaticum_DSM_13514_uid58409’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_calidifontis_JCM_11548_uid58787’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_islandicum_DSM_4184_uid58635’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_neutrophilum_V24Sta_uid58421’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrobaculum_oguniense_TE7_uid84411’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_NA2_uid66551’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_ST04_uid167261’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_abyssi_GE5_uid62903’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_furiosus_COM1_uid169620’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_furiosus_DSM_3638_uid57873’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_horikoshii_OT3_uid57753’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrococcus_yayanosii_CH1_uid68281’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Pyrolobus_fumarii_1A_uid73415’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rahnella_Y9602_uid62715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rahnella_aquatilis_CIP_78_65___ATCC_33071_uid86855’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rahnella_aquatilis_HX2_uid158049’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_eutropha_H16_uid62925’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_eutropha_JMP134_uid58047’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_pickettii_12D_uid58859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_pickettii_12J_uid58737’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_pickettii_DTP0602_uid222229’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_solanacearum_CFBP2957_uid50545’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_solanacearum_CMR15_uid227773’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_solanacearum_FQY_4_f_uid194089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_solanacearum_GMI1000_uid57593’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_solanacearum_PSI07_uid50539’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ralstonia_solanacearum_Po82_uid162133’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ramlibacter_tataouinensis_TTB310_uid68279’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Raoultella_ornithinolytica_B6_uid198431’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Renibacterium_salmoninarum_ATCC_33209_uid58899’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_IRBG74_uid222820’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_NGR234_uid59081’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_etli_CFN_42_uid58377’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_etli_CIAT_652_uid59115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_etli_bv__mimosae_Mim1_uid213896’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_leguminosarum_bv__trifolii_WSM1325_uid58991’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_leguminosarum_bv__trifolii_WSM2304_uid58997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_leguminosarum_bv__viciae_3841_uid57955’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhizobium_tropici_CIAT_899_uid185179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodanobacter_2APBS1_uid74431’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodobacter_capsulatus_SB_1003_uid47509’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodobacter_sphaeroides_2_4_1_uid57653’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodobacter_sphaeroides_ATCC_17025_uid58451’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodobacter_sphaeroides_ATCC_17029_uid58449’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodobacter_sphaeroides_KD131_uid59277’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodococcus_equi_103S_uid60171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodococcus_erythropolis_CCM2595_uid216088’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodococcus_erythropolis_PR4_uid59019’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodococcus_jostii_RHA1_uid58325’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodococcus_opacus_B4_uid13791’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodococcus_pyridinivorans_SB3094_uid232359’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodoferax_ferrireducens_T118_uid58353’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodomicrobium_vannielii_ATCC_17100_uid43247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopirellula_baltica_SH_1_uid61589’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_BisA53_uid58445’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_BisB18_uid58443’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_BisB5_uid58441’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_CGA009_uid62901’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_DX_1_uid43327’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_HaA2_uid58439’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodopseudomonas_palustris_TIE_1_uid58995’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodospirillum_centenum_SW_uid58805’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodospirillum_photometricum_uid159003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodospirillum_rubrum_ATCC_11170_uid57655’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodospirillum_rubrum_F11_uid162149’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodothermus_marinus_DSM_4252_uid41729’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rhodothermus_marinus_SG0_5JP17_172_uid72767’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_africae_ESF_5_uid58799’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_akari_Hartford_uid58161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_australis_Cutlack_uid158039’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_bellii_OSU_85_389_uid58681’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_bellii_RML369_C_uid58405’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_canadensis_CA410_uid88063’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_canadensis_McKiel_uid58159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_conorii_Malish_7_uid57633’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_felis_URRWXCal2_uid58331’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_heilongjiangensis_054_uid70839’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_japonica_YH_uid73963’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_massiliae_AZT80_uid86751’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_massiliae_MTU5_uid58801’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_montanensis_OSU_85_930_uid158043’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_parkeri_Portsmouth_uid158045’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_peacockii_Rustic_uid59301’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_philipii_364D_uid89383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_Breinl_uid196851’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_BuV67_CWPP_uid158063’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_Chernikova_uid158053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_Dachau_uid158057’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_GvV257_uid158051’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_Katsinyian_uid158055’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_Madrid_E_uid61565’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_NMRC_Madrid_E_uid196850’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_Rp22_uid161945’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_prowazekii_RpGvF24_uid158065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rhipicephali_3_7_female6_CWPP_uid156977’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Arizona_uid86655’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Brazil_uid88069’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Colombia_uid86653’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Hauke_uid86659’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Hino_uid86657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Hlp_2_uid88067’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii_Iowa_uid58961’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_rickettsii__Sheila_Smith__uid58027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_slovaca_13_B_uid82369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_slovaca_D_CWPP_uid158159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_typhi_B9991CWPP_uid158357’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_typhi_TH1527_uid158161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rickettsia_typhi_Wilmington_uid58063’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Riemerella_anatipestifer_ATCC_11845___DSM_15868_uid159857’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Riemerella_anatipestifer_ATCC_11845___DSM_15868_uid60727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Riemerella_anatipestifer_RA_CH_1_uid175469’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Riemerella_anatipestifer_RA_CH_2_uid186548’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Riemerella_anatipestifer_RA_GD_uid162013’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rivularia_PCC_7116_uid182929’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Robiginitalea_biformata_HTCC2501_uid58285’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseburia_hominis_A2_183_uid73419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseburia_intestinalis_XB6B4_uid197179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseburia_intestinalis_uid197164’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseiflexus_RS_1_uid58523’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseiflexus_castenholzii_DSM_13941_uid58287’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseobacter_denitrificans_OCh_114_uid58597’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Roseobacter_litoralis_Och_149_uid54719’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rothia_dentocariosa_ATCC_17931_uid49331’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rothia_mucilaginosa_uid43093’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rubrivivax_gelatinosus_IL144_uid158163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Rubrobacter_xylanophilus_DSM_9941_uid58057’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ruegeria_TM1040_uid58193’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ruegeria_pomeroyi_DSS_3_uid57863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ruminococcus_albus_7_uid51721’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ruminococcus_bromii_uid197158’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ruminococcus_champanellensis_18P13_uid197169’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ruminococcus_uid197156’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Runella_slithyformis_DSM_19594_uid68317’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Saccharomonospora_viridis_DSM_43017_uid59055’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Saccharophagus_degradans_2_40_uid57921’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Saccharopolyspora_erythraea_NRRL_2338_uid62947’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Saccharothrix_espanaensis_DSM_44229_uid184826’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salinarchaeum_laminariae_Harcht_Bsk1_uid207001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salinibacter_ruber_DSM_13855_uid58513’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salinibacter_ruber_M8_uid47323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salinispora_arenicola_CNS_205_uid58659’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salinispora_tropica_CNB_440_uid58565’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_bongori_NCTC_12419_uid70155’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_bongori_Sbon_167_uid213088’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_Serovar_Cubana_CFSAN002050_uid212973’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_Serovar_Heidelberg_CFSAN002069_uid212974’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_Serovar_Typhimurium_var__5__CFSAN001921_uid212972’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_arizonae_serovar_62_z4_z23__uid58191’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_4_5_12_i__08_1736_uid212969’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Agona_24249_uid230614’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Agona_SL483_uid59431’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Bareilly_CFSAN000189_uid212971’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Bovismorbificans_3114_uid218006’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Choleraesuis_SC_B67_uid58017’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Dublin_CT_02021853_uid58917’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Enteritidis_P125109_uid59247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Gallinarum_287_91_uid59249’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Gallinarum_Pullorum_CDC1983_67_uid217770’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Gallinarum_pullorum_RKS5078_uid87035’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Heidelberg_41578_uid212970’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Heidelberg_B182_uid162195’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Heidelberg_SL476_uid58973’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Javiana_CFSAN001992_uid190101’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Newport_SL254_uid58831’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Newport_USMARC_S3124_1_uid213895’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Paratyphi_A_AKU_12601_uid59269’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Paratyphi_A_ATCC_9150_uid58201’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Paratyphi_B_SPB7_uid59097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Paratyphi_C_RKS4594_uid59063’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Pullorum_S06004_uid214431’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Schwarzengrund_CVM19633_uid58915’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Thompson_RM6836_uid222802’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhi_CT18_uid57793’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhi_P_stx_12_uid87001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhi_Ty21a_uid201427’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhi_Ty2_uid57973’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_14028S_uid86059’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_798_uid158047’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_D23580_uid86061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_DT2_uid222818’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_LT2_uid57799’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_SL1344_uid86645’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_ST4_74_uid84393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_T000240_uid84397’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_U288_uid198746’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_UK_1_uid87049’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Weltevreden_2007_60_3289_1_uid178014’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Salmonella_typhimurium_DT104_uid223287’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sanguibacter_keddieii_DSM_10542_uid40845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Saprospira_grandis_Lewin_uid89375’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sebaldella_termitidis_ATCC_33386_uid41865’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Segniliparus_rotundus_DSM_44985_uid49049’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Selenomonas_ruminantium_lactilytica_TAM6421_uid157247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Selenomonas_sputigena_ATCC_35185_uid55329’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_AS12_uid67315’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_AS13_uid162065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_ATCC_39006_uid218470’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_liquefaciens_ATCC_27592_uid212306’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_marcescens_FGI94_uid185180’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_marcescens_WW4_uid188478’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_odorifera_4Rx13_uid42253’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_plymuthica_AS9_uid67313’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_plymuthica_S13_uid210642’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_proteamaculans_568_uid58725’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Serratia_symbiotica__Cinara_cedri__uid82363’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_ANA_3_uid58347’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_MR_4_uid58345’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_MR_7_uid58343’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_W3_18_1_uid58341’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_amazonensis_SB2B_uid58257’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_BA175_uid52601’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_OS117_uid162025’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_OS155_uid58259’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_OS185_uid58743’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_OS195_uid58261’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_OS223_uid58775’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_baltica_OS678_uid50553’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_denitrificans_OS217_uid58263’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_frigidimarina_NCIMB_400_uid58265’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_halifaxensis_HAW_EB4_uid59007’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_loihica_PV_4_uid58349’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_oneidensis_MR_1_uid57949’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_pealeana_ATCC_700345_uid58705’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_piezotolerans_WP3_uid58745’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_putrefaciens_200_uid161927’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_putrefaciens_CN_32_uid58267’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_sediminis_HAW_EB3_uid58835’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_violacea_DSS12_uid47085’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shewanella_woodyi_ATCC_51908_uid58721’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_boydii_CDC_3083_94_uid58415’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_boydii_Sb227_uid58215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_dysenteriae_1617_uid229875’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_dysenteriae_Sd197_uid58213’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_flexneri_2002017_uid159233’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_flexneri_2a_2457T_uid57991’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_flexneri_2a_301_uid62907’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_flexneri_5_8401_uid58583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_sonnei_53G_uid84383’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Shigella_sonnei_Ss046_uid58217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sideroxydans_lithotrophicus_ES_1_uid46801’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Simiduia_agarivorans_SA1_uid177713’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Simkania_negevensis_Z_uid68451’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Singulisphaera_acidiphila_DSM_18658_uid81777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_fredii_HH103_uid86865’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_fredii_USDA_257_uid168059’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_medicae_WSM419_uid58549’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_1021_uid57603’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_2011_uid193772’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_AK83_uid52607’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_BL225C_uid52605’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_GR4_uid184823’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_Rm41_uid176372’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sinorhizobium_meliloti_SM11_uid159685’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Slackia_heliotrinireducens_DSM_20476_uid59051’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sodalis_glossinidius__morsitans__uid58553’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Solibacillus_silvestris_StLB046_uid168516’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Solitalea_canadensis_DSM_3403_uid81783’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sorangium_cellulosum_So0157_2_uid210741’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sorangium_cellulosum__So_ce_56__uid61629’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphaerobacter_thermophilus_DSM_20745_uid41997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphaerochaeta_pleomorpha_Grapes_uid82365’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingobacterium_21_uid64755’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingobium_SYK_6_uid73353’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingobium_chlorophenolicum_L_1_uid52597’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingobium_japonicum_UT26S_uid47077’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingomonas_MM_1_uid193771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingomonas_wittichii_RW1_uid58691’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sphingopyxis_alaskensis_RB2256_uid58351’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spiribacter_UAH_SP71_uid226111’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_Buddy_uid63633’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_L21_RPul_D2_uid231658’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_africana_DSM_8902_uid81779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_caldaria_DSM_7334_uid68753’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_coccoides_DSM_17374_uid66331’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_smaragdinae_DSM_11293_uid51369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_thermophila_DSM_6192_uid53037’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirochaeta_thermophila_DSM_6578_uid162041’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spiroplasma_apis_B31_uid230613’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spiroplasma_chrysopicola_DF_1_uid205053’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spiroplasma_diminutum_CUAS_1_uid212976’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spiroplasma_syrphidicola_EA_1_uid205054’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spiroplasma_taiwanense_CT_1_uid212975’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Spirosoma_linguale_DSM_74_uid43413’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stackebrandtia_nassauensis_DSM_44728_uid46663’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stanieria_cyanosphaera_PCC_7437_uid183115’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_04_02981_uid161969’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_08BA02176_uid175257’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_11819_97_uid159981’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_55_2053_uid55909’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_6850_uid217772’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_71193_uid162141’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_Bmb9393_uid210640’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_CC45_uid209174’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_CN1_uid217769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_COL_uid57797’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ECT_R_2_uid159389’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ED133_uid159689’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ED98_uid41455’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_HO_5096_0412_uid162163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_JH1_uid58457’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_JH9_uid58455’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_JKD6008_uid159855’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_JKD6159_uid159691’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_LGA251_uid159391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_M013_uid88065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_M1_uid197263’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_MRSA252_uid57839’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_MSHR1132_uid89393’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_MSSA476_uid57841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_MW2_uid57903’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_Mu3_uid58817’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_Mu50_uid57835’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_N315_uid57837’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_NCTC_8325_uid57795’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_Newman_uid58839’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_RF122_uid57661’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_SA40_uid221289’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_SA957_uid221288’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST228_10388_uid193754’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST228_10497_uid193755’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST228_15532_uid193756’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST228_16035_uid193757’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST228_18412_uid193760’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST228_18583_uid193761’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_ST398_uid159247’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_T0131_uid159861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_TCH60_uid159859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_TW20_uid159241’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_USA300_FPR3757_uid58555’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_USA300_TCH1516_uid58925’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_VC40_uid88071’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_Z172_uid225604’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_uid193758’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_aureus_uid193759’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_carnosus_TM300_uid59401’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_epidermidis_ATCC_12228_uid57861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_epidermidis_RP62A_uid57663’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_haemolyticus_JCSC1435_uid62919’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_lugdunensis_HKU09_01_uid46233’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_lugdunensis_N920143_uid162143’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_pasteuri_SP1_uid226267’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_pseudintermedius_ED99_uid162109’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_pseudintermedius_HKU10_03_uid62125’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_saprophyticus_ATCC_15305_uid58411’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylococcus_warneri_SG1_uid187059’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylothermus_hellenicus_DSM_12710_uid45893’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Staphylothermus_marinus_F1_uid58719’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Starkeya_novella_DSM_506_uid48815’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stenotrophomonas_maltophilia_D457_uid162199’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stenotrophomonas_maltophilia_JV3_uid72473’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stenotrophomonas_maltophilia_K279a_uid61647’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stenotrophomonas_maltophilia_R551_3_uid58657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Stigmatella_aurantiaca_DW4_3_1_uid158509’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Strawberry_lethal_yellows_phytoplasma__CPA__NZSb11_uid203392’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptobacillus_moniliformis_DSM_12112_uid41863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_I_G2_uid224251’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_I_P16_uid224252’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_09mas018883_uid208674’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_2603V_R_uid57943’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_2_22_uid202215’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_A909_uid57935’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_GD201008_001_uid175780’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_ILRI005_uid208676’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_ILRI112_uid208675’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_NEM316_uid61585’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_agalactiae_SA20_06_uid178722’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_anginosus_C1051_uid218003’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_anginosus_C238_uid218004’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_constellatus_pharyngis_C1050_uid218002’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_constellatus_pharyngis_C232_uid217998’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_constellatus_pharyngis_C818_uid218001’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_dysgalactiae_equisimilis_167_uid222822’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_dysgalactiae_equisimilis_AC_2713_uid178644’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_dysgalactiae_equisimilis_ATCC_12394_uid161979’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_dysgalactiae_equisimilis_GGS_124_uid59103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_dysgalactiae_equisimilis_RE378_uid176684’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_equi_4047_uid59259’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_equi_zooepidemicus_ATCC_35246_uid162155’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_equi_zooepidemicus_MGCS10565_uid59263’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_equi_zooepidemicus_uid59261’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_gallolyticus_ATCC_43143_uid162103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_gallolyticus_ATCC_BAA_2069_uid63617’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_gallolyticus_UCN34_uid46061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_gordonii_Challis_substr__CH1_uid57667’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_infantarius_CJ18_uid87033’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_iniae_SF1_uid206041’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_intermedius_B196_uid218000’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_intermedius_C270_uid217999’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_intermedius_JTH08_uid168614’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_lutetiensis_033_uid213397’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_macedonicus_ACA_DC_198_uid81631’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_mitis_B6_uid46097’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_mutans_GS_5_uid169223’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_mutans_LJ23_uid162197’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_mutans_NN2025_uid46353’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_mutans_UA159_uid57947’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_oligofermentans_AS_1_3089_uid201429’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_oralis_Uo5_uid65449’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_parasanguinis_ATCC_15912_uid49313’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_parasanguinis_FW213_uid163997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_parauberis_KCTC_11537_uid67355’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pasteurianus_ATCC_43144_uid68019’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_670_6B_uid52533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_70585_uid59125’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_A026_uid226114’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_AP200_uid52453’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_ATCC_700669_uid59287’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_CGSP14_uid59181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_D39_uid58581’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_G54_uid59167’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_Hungary19A_6_uid59117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_INV104_uid162039’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_INV200_uid162035’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_JJA_uid59121’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_OXC141_uid162037’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_P1031_uid59123’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_R6_uid57859’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPN032672_uid197189’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPN033038_uid197190’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPN034156_uid197185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPN034183_uid197186’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPN994038_uid197187’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPN994039_uid197188’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_SPNA45_uid174986’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_ST556_uid162191’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_TCH8431_19A_uid49735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_TIGR4_uid57857’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_Taiwan19F_14_uid59119’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pneumoniae_gamPNI0373_uid175861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pseudopneumoniae_IS7493_uid71153’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_A20_uid178106’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_Alab49_uid162171’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_HSC5_uid212978’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_M1_476_uid193766’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_M1_GAS_uid57845’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS10270_uid58571’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS10394_uid58105’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS10750_uid58575’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS15252_uid158037’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS1882_uid158061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS2096_uid58573’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS315_uid57911’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS5005_uid58337’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS6180_uid58335’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS8232_uid57871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_MGAS9429_uid58569’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_Manfredo_uid57847’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_NZ131_uid59035’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_pyogenes_SSI_1_uid57895’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_salivarius_57_I_uid162151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_salivarius_CCHSS3_uid70481’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_salivarius_JIM8777_uid162145’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_sanguinis_SK36_uid58381’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_05ZYH33_uid58663’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_98HAH33_uid58665’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_A7_uid162111’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_BM407_uid59321’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_D12_uid162127’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_D9_uid162125’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_GZ1_uid161937’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_JS14_uid162095’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_P1_7_uid32235’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_S735_uid174333’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_SC070731_uid193769’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_SC84_uid59323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_SS12_uid162123’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_ST1_uid167482’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_ST3_uid66327’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_T15_uid226112’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_TL13_uid203123’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_suis_YB51_uid222230’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_thermophilus_CNRZ1066_uid58221’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_thermophilus_JIM_8232_uid162157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_thermophilus_LMD_9_uid58327’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_thermophilus_LMG_18311_uid58219’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_thermophilus_MN_ZLW_002_uid166827’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_thermophilus_ND03_uid162015’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptococcus_uberis_0140J_uid57959’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_PAMC26508_uid197217’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_SirexAA_E_uid72627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_albus_J1074_uid196849’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_avermitilis_MA_4680_uid57739’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_bingchenggensis_BCW_1_uid82931’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_cattleya_NRRL_8057___DSM_46488_uid162187’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_cattleya_NRRL_8057___DSM_46488_uid77117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_coelicolor_A3_2__uid57801’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_collinus_Tu_365_uid214429’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_davawensis_JCM_4913_uid193657’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_flavogriseus_ATCC_33331_uid40839’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_fulvissimus_DSM_40593_uid201038’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_griseus_NBRC_13350_uid58983’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_hygroscopicus_jinggangensis_5008_uid89409’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_hygroscopicus_jinggangensis_TL01_uid189753’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_rapamycinicus_NRRL_5491_uid227224’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_scabiei_87_22_uid46531’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_venezuelae_ATCC_10712_uid177080’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptomyces_violaceusniger_Tu_4113_uid52609’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Streptosporangium_roseum_DSM_43021_uid42521’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfobacillus_acidophilus_DSM_10332_uid88061’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfobacillus_acidophilus_TPY_uid68841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_acidocaldarius_DSM_639_uid58379’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_acidocaldarius_N8_uid189027’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_acidocaldarius_Ron12_I_uid189028’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_acidocaldarius_SUSAZ_uid232254’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_HVE10_4_uid162067’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_LAL14_1_uid197216’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_L_D_8_5_uid43679’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_L_S_2_15_uid58871’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_M_14_25_uid58849’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_M_16_27_uid58851’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_M_16_4_uid58841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_REY15A_uid162071’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_Y_G_57_14_uid58923’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_islandicus_Y_N_15_51_uid58825’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_solfataricus_98_2_uid167998’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_solfataricus_P2_uid57721’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfolobus_tokodaii_7_uid57807’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfuricella_denitrificans_skB26_uid170240’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfuricurvum_kujiense_DSM_16994_uid60789’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurihydrogenibium_YO3AOP1_uid58855’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurihydrogenibium_azorense_Az_Fu1_uid58121’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurimonas_autotrophica_DSM_16294_uid53043’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurimonas_denitrificans_DSM_1251_uid58185’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurospirillum_barnesii_SES_3_uid168117’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurospirillum_deleyianum_DSM_6946_uid41861’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Sulfurovum_NBC37_1_uid58863’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Symbiobacterium_thermophilum_IAM_14863_uid58165’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_CC9311_uid58123’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_CC9605_uid58319’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_CC9902_uid58323’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_JA_2_3B_a_2_13__uid58537’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_JA_3_3Ab_uid58535’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_PCC_6312_uid182934’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_PCC_7002_uid59137’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_PCC_7502_uid183008’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_RCC307_uid61609’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_WH_7803_uid61607’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_WH_8102_uid61581’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_elongatus_PCC_6301_uid58235’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechococcus_elongatus_PCC_7942_uid58045’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechocystis_PCC_6803_substr__GT_I_uid157913’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechocystis_PCC_6803_substr__GT_I_uid158059’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechocystis_PCC_6803_substr__PCC_N_uid159835’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechocystis_PCC_6803_uid159873’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechocystis_PCC_6803_uid189748’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synechocystis_PCC_6803_uid57659’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Synergistetes_bacterium_SGP1_uid197182’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Syntrophobacter_fumaroxidans_MPOB_uid58177’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Syntrophobotulus_glycolicus_DSM_8271_uid63343’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Syntrophomonas_wolfei_Goettingen_uid58179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Syntrophothermus_lipocalidus_DSM_12680_uid49527’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Syntrophus_aciditrophicus_SB_uid58539’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tannerella_forsythia_ATCC_43037_uid83157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Taylorella_asinigenitalis_14_45_uid197194’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Taylorella_asinigenitalis_MCE3_uid73771’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Taylorella_equigenitalis_14_56_uid197193’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Taylorella_equigenitalis_ATCC_35865_uid170255’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Taylorella_equigenitalis_MCE9_uid62103’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tepidanaerobacter_Re1_uid66873’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tepidanaerobacter_acetatoxydans_Re1_uid184827’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Teredinibacter_turnerae_T7901_uid59267’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Terriglobus_roseus_DSM_18391_uid168183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Terriglobus_saanensis_SP1PR4_uid53251’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tetragenococcus_halophilus_uid74441’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thalassobaculum_L2_uid182483’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thalassolituus_oleivorans_MIL_1_uid195604’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thauera_MZ1T_uid58987’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermacetogenium_phaeum_DSM_12270_uid177811’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermaerobacter_marianensis_DSM_12885_uid61727’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermanaerovibrio_acidaminovorans_DSM_6589_uid41925’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermincola_potens_JR_uid48823’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_X513_uid53065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_X514_uid58589’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_brockii_finnii_Ako_1_uid55639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_italicus_Ab9_uid46241’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_mathranii_A3_uid49481’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_pseudethanolicus_ATCC_33223_uid58339’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_tengcongensis_MB4_uid57813’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacter_wiegelii_Rt8_B1_uid52581’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacterium_thermosaccharolyticum_DSM_571_uid51639’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacterium_thermosaccharolyticum_M0795_uid184821’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoanaerobacterium_xylanolyticum_LX_11_uid63163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermobacillus_composti_KWC4_uid74021’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermobaculum_terrenum_ATCC_BAA_798_uid42011’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermobifida_fusca_YX_uid57703’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermobispora_bispora_DSM_43833_uid48999’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_4557_uid70841’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_AM4_uid54735’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_CL1_uid168259’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_barophilus_MP_uid54733’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_gammatolerans_EJ3_uid59389’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_kodakarensis_KOD1_uid58225’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_litoralis_DSM_5473_uid82997’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_onnurineus_NA1_uid59043’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermococcus_sibiricus_MM_739_uid59399’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermocrinis_albus_DSM_14484_uid46231’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermodesulfatator_indicus_DSM_15286_uid68285’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermodesulfobacterium_OPB45_uid68283’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermodesulfobium_narugense_DSM_14796_uid66601’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermodesulfovibrio_yellowstonii_DSM_11347_uid59257’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermofilum_1910b_uid215374’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermofilum_pendens_Hrk_5_uid58563’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermogladius_1633_uid167488’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermomicrobium_roseum_DSM_5159_uid59341’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermomonospora_curvata_DSM_43183_uid41885’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoplasma_acidophilum_DSM_1728_uid61573’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoplasma_volcanium_GSS1_uid57751’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoplasmatales_archaeon_BRNA1_uid195930’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoproteus_tenax_Kra_1_uid74443’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermoproteus_uzoniensis_768_20_uid65089’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermosediminibacter_oceani_DSM_16646_uid51421’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermosipho_africanus_TCF52B_uid59095’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermosipho_melanesiensis_BI429_uid58683’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermosphaera_aggregans_DSM_11486_uid48993’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermosynechococcus_NK55_uid231517’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermosynechococcus_elongatus_BP_1_uid57907’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_RQ2_uid58935’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_elfii_NBRC_107921_uid227422’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_hypogea_NBRC_106472_uid227423’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_lettingae_TMO_uid58419’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_maritima_MSB8_uid179902’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_maritima_MSB8_uid202924’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_maritima_MSB8_uid57723’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_naphthophila_RKU_10_uid42777’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_neapolitana_DSM_4359_uid59065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_petrophila_RKU_1_uid58655’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermotoga_thermarum_DSM_5069_uid68449’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermovibrio_ammonificans_HB_1_uid62095’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermovirga_lienii_DSM_17291_uid77129’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_CCB_US3_UF1_uid81197’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_oshimai_JL_2_uid178948’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_scotoductus_SA_01_uid62273’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_thermophilus_HB27_uid58033’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_thermophilus_HB8_uid58223’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_thermophilus_JL_18_uid162129’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thermus_thermophilus_SG0_5JP17_16_uid159537’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thioalkalimicrobium_cyclicum_ALM1_uid67391’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thioalkalivibrio_K90mix_uid46181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thioalkalivibrio_nitratireducens_DSM_14787_uid184011’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thioalkalivibrio_sulfidophilus_HL_EbGr7_uid59179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thiobacillus_denitrificans_ATCC_25259_uid58189’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thiocystis_violascens_DSM_198_uid74025’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thioflavicoccus_mobilis_8321_uid184343’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thiomicrospira_crunogena_XCL_2_uid58183’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thiomonas_3As_uid178369’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Thiomonas_intermedia_K12_uid48825’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tistrella_mobilis_KA081020_065_uid167486’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tolumonas_auensis_DSM_9187_uid59395’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_azotonutricium_ZAS_9_uid67365’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_brennaborense_DSM_12168_uid66607’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_denticola_ATCC_35405_uid57583’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_Chicago_uid159543’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_DAL_1_uid87065’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_Fribourg_Blanc_uid201428’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_Mexico_A_uid176920’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_Nichols_uid208669’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_Nichols_uid57585’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_SS14_uid58977’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_pertenue_CDC2_uid87051’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_pertenue_Gauthier_uid87067’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pallidum_pertenue_SamoaD_uid87069’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_paraluiscuniculi_Cuniculi_A_uid68447’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_pedis_T_A4_uid215715’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_primitia_ZAS_2_uid67367’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Treponema_succinifaciens_DSM_2489_uid65781’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Trichodesmium_erythraeum_IMS101_uid57925’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tropheryma_whipplei_TW08_27_uid57961’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tropheryma_whipplei_Twist_uid57705’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Truepera_radiovictrix_DSM_17093_uid49533’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Tsukamurella_paurometabola_DSM_20162_uid48829’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Turneriella_parva_DSM_21527_uid168321’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ureaplasma_parvum_serovar_3_ATCC_27815_uid58887’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ureaplasma_parvum_serovar_3_ATCC_700970_uid57711’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Ureaplasma_urealyticum_serovar_10_ATCC_33699_uid59011’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Variovorax_paradoxus_B4_uid218005’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Variovorax_paradoxus_EPS_uid62107’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Variovorax_paradoxus_S110_uid59437’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Veillonella_parvula_DSM_2008_uid41927’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Verminephrobacter_eiseniae_EF01_2_uid58675’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Verrucosispora_maris_AB_18_032_uid66297’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_EJY3_uid83161’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_Ex25_uid41601’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_alginolyticus_NBRC_15630___ATCC_17749_uid199933’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_anguillarum_775_uid68057’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_IEC224_uid89389’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_LMA3984_4_uid159541’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_M66_2_uid59355’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_MJ_1236_uid59387’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_O1_2010EL_1786_uid78933’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_O1_biovar_El_Tor_N16961_uid57623’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_O395_uid159869’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_cholerae_O395_uid58425’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_fischeri_ES114_uid58163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_fischeri_MJ11_uid58907’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_furnissii_NCTC_11218_uid82347’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_harveyi_ATCC_BAA_1116_uid218471’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_harveyi_ATCC_BAA_1116_uid58957’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_nigripulchritudo_SnF1_uid222819’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_parahaemolyticus_BB22OP_uid184822’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_parahaemolyticus_RIMD_2210633_uid57969’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_splendidus_LGP32_uid59353’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_vulnificus_CMCP6_uid62909’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_vulnificus_MO6_24_O_uid62243’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vibrio_vulnificus_YJ016_uid58007’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vulcanisaeta_distributa_DSM_14429_uid52827’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Vulcanisaeta_moutnovskia_768_28_uid63631’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Waddlia_chondrophila_WSU_86_1044_uid49531’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Weeksella_virosa_DSM_16922_uid63627’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Weissella_koreensis_KACC_15510_uid68837’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wigglesworthia_glossinidia_endosymbiont_of_Glossina_brevipalpis_uid57853’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wigglesworthia_glossinidia_endosymbiont_of_Glossina_morsitans__Yale_colony__uid88075’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_endosymbiont_TRS_of_Brugia_malayi_uid58107’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_endosymbiont_of_Culex_quinquefasciatus_Pel_uid61645’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_endosymbiont_of_Drosophila_melanogaster_uid57851’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_endosymbiont_of_Drosophila_simulans_wHa_uid198768’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_endosymbiont_of_Drosophila_simulans_wNo_uid198767’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_endosymbiont_of_Onchocerca_ochengi_uid171829’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolbachia_wRi_uid59371’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Wolinella_succinogenes_DSM_1740_uid61591’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthobacter_autotrophicus_Py2_uid58453’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_albilineans_GPE_PC73_uid43163’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_axonopodis_Xac29_1_uid193774’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_axonopodis_citri_306_uid57889’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_axonopodis_citrumelo_F1_uid73179’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_campestris_8004_uid57595’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_campestris_ATCC_33913_uid57887’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_campestris_raphani_756C_uid159539’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_campestris_uid61643’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_campestris_vesicatoria_85_10_uid58321’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_citri_Aw12879_uid194444’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_fuscans_4834_R_uid222814’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_oryzae_KACC_10331_uid58155’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_oryzae_MAFF_311018_uid58547’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_oryzae_PXO99A_uid59131’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xanthomonas_oryzae_oryzicola_BLS256_uid54411’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xenorhabdus_bovienii_SS_2004_uid46345’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xenorhabdus_nematophila_ATCC_19061_uid49133’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xylanimonas_cellulosilytica_DSM_15894_uid41935’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xylella_fastidiosa_9a5c_uid57849’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xylella_fastidiosa_GB514_uid162023’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xylella_fastidiosa_M12_uid58763’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xylella_fastidiosa_M23_uid58809’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Xylella_fastidiosa_Temecula1_uid57869’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_enterocolitica_8081_uid57741’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_enterocolitica_palearctica_105_5R_r__uid63663’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_enterocolitica_palearctica_Y11_uid162069’ as it is excluded/not-included.
    --2020-11-10 20:19:33--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 3,451       --.-K/s   in 0s      
    
    2020-11-10 20:19:33 (315 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/.listing’ saved [3451]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/.listing’.
    Rejecting ‘NC_017168.GeneMark-2.5m’.
    Rejecting ‘NC_017168.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017168.Glimmer3’.
    Rejecting ‘NC_017168.Prodigal-2.50’.
    Rejecting ‘NC_017168.asn’.
    Rejecting ‘NC_017168.ffn’.
    Rejecting ‘NC_017168.fna’.
    Rejecting ‘NC_017168.frn’.
    Rejecting ‘NC_017168.gbk’.
    Rejecting ‘NC_017168.gbs’.
    Rejecting ‘NC_017168.gff’.
    Rejecting ‘NC_017168.ptt’.
    Rejecting ‘NC_017168.rnt’.
    Rejecting ‘NC_017168.rpt’.
    Rejecting ‘NC_017168.tab’.
    Rejecting ‘NC_017168.val’.
    Rejecting ‘NC_017169.GeneMark-2.5m’.
    Rejecting ‘NC_017169.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017169.Glimmer3’.
    Rejecting ‘NC_017169.Prodigal-2.50’.
    Rejecting ‘NC_017169.asn’.
    Rejecting ‘NC_017169.ffn’.
    Rejecting ‘NC_017169.fna’.
    Rejecting ‘NC_017169.gbk’.
    Rejecting ‘NC_017169.gbs’.
    Rejecting ‘NC_017169.gff’.
    Rejecting ‘NC_017169.ptt’.
    Rejecting ‘NC_017169.rpt’.
    Rejecting ‘NC_017169.tab’.
    Rejecting ‘NC_017169.val’.
    Rejecting ‘NC_017170.GeneMark-2.5m’.
    Rejecting ‘NC_017170.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017170.Glimmer3’.
    Rejecting ‘NC_017170.Prodigal-2.50’.
    Rejecting ‘NC_017170.asn’.
    Rejecting ‘NC_017170.ffn’.
    Rejecting ‘NC_017170.fna’.
    Rejecting ‘NC_017170.gbk’.
    Rejecting ‘NC_017170.gbs’.
    Rejecting ‘NC_017170.gff’.
    Rejecting ‘NC_017170.ptt’.
    Rejecting ‘NC_017170.rpt’.
    Rejecting ‘NC_017170.tab’.
    Rejecting ‘NC_017170.val’.
    --2020-11-10 20:19:33--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017168.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017168.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017168.faa ... done.
    Length: 1658084 (1.6M)
    
    100%[======================================>] 1,658,084   3.41MB/s   in 0.5s   
    
    2020-11-10 20:19:33 (3.41 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017168.faa’ saved [1658084]
    
    --2020-11-10 20:19:33--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017169.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017169.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017169.faa ... done.
    Length: 36609 (36K)
    
    100%[======================================>] 36,609      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:33 (2.01 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017169.faa’ saved [36609]
    
    --2020-11-10 20:19:33--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017170.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017170.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017170.faa ... done.
    Length: 2769 (2.7K)
    
    100%[======================================>] 2,769       --.-K/s   in 0s      
    
    2020-11-10 20:19:34 (399 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_A1122_uid158119/NC_017170.faa’ saved [2769]
    
    --2020-11-10 20:19:34--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 3,735       --.-K/s   in 0.04s   
    
    2020-11-10 20:19:34 (86.9 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/.listing’ saved [3735]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/.listing’.
    Rejecting ‘NC_010157.GeneMark-2.5m’.
    Rejecting ‘NC_010157.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_010157.Glimmer3’.
    Rejecting ‘NC_010157.Prodigal-2.50’.
    Rejecting ‘NC_010157.asn’.
    Rejecting ‘NC_010157.ffn’.
    Rejecting ‘NC_010157.fna’.
    Rejecting ‘NC_010157.frn’.
    Rejecting ‘NC_010157.gbk’.
    Rejecting ‘NC_010157.gbs’.
    Rejecting ‘NC_010157.gff’.
    Rejecting ‘NC_010157.ptt’.
    Rejecting ‘NC_010157.rnt’.
    Rejecting ‘NC_010157.rpt’.
    Rejecting ‘NC_010157.tab’.
    Rejecting ‘NC_010157.val’.
    Rejecting ‘NC_010158.GeneMark-2.5m’.
    Rejecting ‘NC_010158.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_010158.Glimmer3’.
    Rejecting ‘NC_010158.Prodigal-2.50’.
    Rejecting ‘NC_010158.asn’.
    Rejecting ‘NC_010158.ffn’.
    Rejecting ‘NC_010158.fna’.
    Rejecting ‘NC_010158.frn’.
    Rejecting ‘NC_010158.gbk’.
    Rejecting ‘NC_010158.gbs’.
    Rejecting ‘NC_010158.gff’.
    Rejecting ‘NC_010158.ptt’.
    Rejecting ‘NC_010158.rnt’.
    Rejecting ‘NC_010158.rpt’.
    Rejecting ‘NC_010158.tab’.
    Rejecting ‘NC_010158.val’.
    Rejecting ‘NC_010159.GeneMark-2.5m’.
    Rejecting ‘NC_010159.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_010159.Glimmer3’.
    Rejecting ‘NC_010159.Prodigal-2.50’.
    Rejecting ‘NC_010159.asn’.
    Rejecting ‘NC_010159.ffn’.
    Rejecting ‘NC_010159.fna’.
    Rejecting ‘NC_010159.frn’.
    Rejecting ‘NC_010159.gbk’.
    Rejecting ‘NC_010159.gbs’.
    Rejecting ‘NC_010159.gff’.
    Rejecting ‘NC_010159.ptt’.
    Rejecting ‘NC_010159.rnt’.
    Rejecting ‘NC_010159.rpt’.
    Rejecting ‘NC_010159.tab’.
    Rejecting ‘NC_010159.val’.
    --2020-11-10 20:19:34--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010157.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010157.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_010157.faa ... done.
    Length: 25160 (25K)
    
    100%[======================================>] 25,160      --.-K/s   in 0.01s   
    
    2020-11-10 20:19:34 (1.81 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010157.faa’ saved [25160]
    
    --2020-11-10 20:19:34--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010158.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010158.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_010158.faa ... done.
    Length: 40329 (39K)
    
    100%[======================================>] 40,329      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:34 (2.23 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010158.faa’ saved [40329]
    
    --2020-11-10 20:19:34--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010159.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010159.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_010159.faa ... done.
    Length: 1526392 (1.5M)
    
    100%[======================================>] 1,526,392   4.05MB/s   in 0.4s   
    
    2020-11-10 20:19:35 (4.05 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Angola_uid58485/NC_010159.faa’ saved [1526392]
    
    --2020-11-10 20:19:35--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 4,554       --.-K/s   in 0.1s    
    
    2020-11-10 20:19:35 (33.8 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/.listing’ saved [4554]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/.listing’.
    Rejecting ‘NC_008120.GeneMark-2.5m’.
    Rejecting ‘NC_008120.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008120.Glimmer3’.
    Rejecting ‘NC_008120.Prodigal-2.50’.
    Rejecting ‘NC_008120.asn’.
    Rejecting ‘NC_008120.ffn’.
    Rejecting ‘NC_008120.fna’.
    Rejecting ‘NC_008120.gbk’.
    Rejecting ‘NC_008120.gbs’.
    Rejecting ‘NC_008120.gff’.
    Rejecting ‘NC_008120.ptt’.
    Rejecting ‘NC_008120.rpt’.
    Rejecting ‘NC_008120.tab’.
    Rejecting ‘NC_008120.val’.
    Rejecting ‘NC_008121.GeneMark-2.5m’.
    Rejecting ‘NC_008121.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008121.Glimmer3’.
    Rejecting ‘NC_008121.Prodigal-2.50’.
    Rejecting ‘NC_008121.asn’.
    Rejecting ‘NC_008121.ffn’.
    Rejecting ‘NC_008121.fna’.
    Rejecting ‘NC_008121.gbk’.
    Rejecting ‘NC_008121.gbs’.
    Rejecting ‘NC_008121.gff’.
    Rejecting ‘NC_008121.ptt’.
    Rejecting ‘NC_008121.rpt’.
    Rejecting ‘NC_008121.tab’.
    Rejecting ‘NC_008121.val’.
    Rejecting ‘NC_008122.GeneMark-2.5m’.
    Rejecting ‘NC_008122.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008122.Glimmer3’.
    Rejecting ‘NC_008122.Prodigal-2.50’.
    Rejecting ‘NC_008122.asn’.
    Rejecting ‘NC_008122.ffn’.
    Rejecting ‘NC_008122.fna’.
    Rejecting ‘NC_008122.gbk’.
    Rejecting ‘NC_008122.gbs’.
    Rejecting ‘NC_008122.gff’.
    Rejecting ‘NC_008122.ptt’.
    Rejecting ‘NC_008122.rpt’.
    Rejecting ‘NC_008122.tab’.
    Rejecting ‘NC_008122.val’.
    Rejecting ‘NC_008150.GeneMark-2.5m’.
    Rejecting ‘NC_008150.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008150.Glimmer3’.
    Rejecting ‘NC_008150.Prodigal-2.50’.
    Rejecting ‘NC_008150.asn’.
    Rejecting ‘NC_008150.ffn’.
    Rejecting ‘NC_008150.fna’.
    Rejecting ‘NC_008150.frn’.
    Rejecting ‘NC_008150.gbk’.
    Rejecting ‘NC_008150.gbs’.
    Rejecting ‘NC_008150.gff’.
    Rejecting ‘NC_008150.ptt’.
    Rejecting ‘NC_008150.rnt’.
    Rejecting ‘NC_008150.rpt’.
    Rejecting ‘NC_008150.tab’.
    Rejecting ‘NC_008150.val’.
    --2020-11-10 20:19:35--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008120.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008120.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008120.faa ... done.
    Length: 36062 (35K)
    
    100%[======================================>] 36,062      --.-K/s   in 0.01s   
    
    2020-11-10 20:19:35 (2.58 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008120.faa’ saved [36062]
    
    --2020-11-10 20:19:35--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008121.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008121.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008121.faa ... done.
    Length: 2474 (2.4K)
    
    100%[======================================>] 2,474       --.-K/s   in 0s      
    
    2020-11-10 20:19:35 (212 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008121.faa’ saved [2474]
    
    --2020-11-10 20:19:35--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008122.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008122.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008122.faa ... done.
    Length: 25522 (25K)
    
    100%[======================================>] 25,522      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:35 (1018 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008122.faa’ saved [25522]
    
    --2020-11-10 20:19:35--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008150.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008150.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008150.faa ... done.
    Length: 1708646 (1.6M)
    
    100%[======================================>] 1,708,646   4.35MB/s   in 0.4s   
    
    2020-11-10 20:19:36 (4.35 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Antiqua_uid58607/NC_008150.faa’ saved [1708646]
    
    --2020-11-10 20:19:36--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 4,696       --.-K/s   in 0.1s    
    
    2020-11-10 20:19:36 (33.7 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/.listing’ saved [4696]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/.listing’.
    Rejecting ‘NC_003131.GeneMark-2.5m’.
    Rejecting ‘NC_003131.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_003131.Glimmer3’.
    Rejecting ‘NC_003131.Prodigal-2.50’.
    Rejecting ‘NC_003131.asn’.
    Rejecting ‘NC_003131.ffn’.
    Rejecting ‘NC_003131.fna’.
    Rejecting ‘NC_003131.frn’.
    Rejecting ‘NC_003131.gbk’.
    Rejecting ‘NC_003131.gbs’.
    Rejecting ‘NC_003131.gff’.
    Rejecting ‘NC_003131.ptt’.
    Rejecting ‘NC_003131.rnt’.
    Rejecting ‘NC_003131.rpt’.
    Rejecting ‘NC_003131.tab’.
    Rejecting ‘NC_003131.val’.
    Rejecting ‘NC_003132.GeneMark-2.5m’.
    Rejecting ‘NC_003132.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_003132.Glimmer3’.
    Rejecting ‘NC_003132.Prodigal-2.50’.
    Rejecting ‘NC_003132.asn’.
    Rejecting ‘NC_003132.ffn’.
    Rejecting ‘NC_003132.fna’.
    Rejecting ‘NC_003132.gbk’.
    Rejecting ‘NC_003132.gbs’.
    Rejecting ‘NC_003132.gff’.
    Rejecting ‘NC_003132.ptt’.
    Rejecting ‘NC_003132.rpt’.
    Rejecting ‘NC_003132.tab’.
    Rejecting ‘NC_003132.val’.
    Rejecting ‘NC_003134.GeneMark-2.5m’.
    Rejecting ‘NC_003134.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_003134.Glimmer3’.
    Rejecting ‘NC_003134.Prodigal-2.50’.
    Rejecting ‘NC_003134.asn’.
    Rejecting ‘NC_003134.ffn’.
    Rejecting ‘NC_003134.fna’.
    Rejecting ‘NC_003134.gbk’.
    Rejecting ‘NC_003134.gbs’.
    Rejecting ‘NC_003134.gff’.
    Rejecting ‘NC_003134.ptt’.
    Rejecting ‘NC_003134.rpt’.
    Rejecting ‘NC_003134.tab’.
    Rejecting ‘NC_003134.val’.
    Rejecting ‘NC_003143.GeneMark-2.5m’.
    Rejecting ‘NC_003143.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_003143.Glimmer3’.
    Rejecting ‘NC_003143.Prodigal-2.50’.
    Rejecting ‘NC_003143.asn’.
    Rejecting ‘NC_003143.ffn’.
    Rejecting ‘NC_003143.fna’.
    Rejecting ‘NC_003143.frn’.
    Rejecting ‘NC_003143.gbk’.
    Rejecting ‘NC_003143.gbs’.
    Rejecting ‘NC_003143.gff’.
    Rejecting ‘NC_003143.ptt’.
    Rejecting ‘NC_003143.rnt’.
    Rejecting ‘NC_003143.rpt’.
    Rejecting ‘NC_003143.tab’.
    Rejecting ‘NC_003143.val’.
    --2020-11-10 20:19:36--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003131.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003131.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_003131.faa ... done.
    Length: 22149 (22K)
    
    100%[======================================>] 22,149      --.-K/s   in 0.01s   
    
    2020-11-10 20:19:36 (1.65 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003131.faa’ saved [22149]
    
    --2020-11-10 20:19:36--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003132.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003132.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_003132.faa ... done.
    Length: 2574 (2.5K)
    
    100%[======================================>] 2,574       --.-K/s   in 0s      
    
    2020-11-10 20:19:36 (389 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003132.faa’ saved [2574]
    
    --2020-11-10 20:19:36--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003134.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003134.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_003134.faa ... done.
    Length: 35228 (34K)
    
    100%[======================================>] 35,228      --.-K/s   in 0.01s   
    
    2020-11-10 20:19:37 (2.69 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003134.faa’ saved [35228]
    
    --2020-11-10 20:19:37--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003143.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003143.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_003143.faa ... done.
    Length: 1590563 (1.5M)
    
    100%[======================================>] 1,590,563   3.90MB/s   in 0.4s   
    
    2020-11-10 20:19:37 (3.90 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_CO92_uid57621/NC_003143.faa’ saved [1590563]
    
    --2020-11-10 20:19:37--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 4,554       --.-K/s   in 0.1s    
    
    2020-11-10 20:19:37 (31.0 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/.listing’ saved [4554]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/.listing’.
    Rejecting ‘NC_017153.GeneMark-2.5m’.
    Rejecting ‘NC_017153.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017153.Glimmer3’.
    Rejecting ‘NC_017153.Prodigal-2.50’.
    Rejecting ‘NC_017153.asn’.
    Rejecting ‘NC_017153.ffn’.
    Rejecting ‘NC_017153.fna’.
    Rejecting ‘NC_017153.gbk’.
    Rejecting ‘NC_017153.gbs’.
    Rejecting ‘NC_017153.gff’.
    Rejecting ‘NC_017153.ptt’.
    Rejecting ‘NC_017153.rpt’.
    Rejecting ‘NC_017153.tab’.
    Rejecting ‘NC_017153.val’.
    Rejecting ‘NC_017154.GeneMark-2.5m’.
    Rejecting ‘NC_017154.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017154.Glimmer3’.
    Rejecting ‘NC_017154.Prodigal-2.50’.
    Rejecting ‘NC_017154.asn’.
    Rejecting ‘NC_017154.ffn’.
    Rejecting ‘NC_017154.fna’.
    Rejecting ‘NC_017154.frn’.
    Rejecting ‘NC_017154.gbk’.
    Rejecting ‘NC_017154.gbs’.
    Rejecting ‘NC_017154.gff’.
    Rejecting ‘NC_017154.ptt’.
    Rejecting ‘NC_017154.rnt’.
    Rejecting ‘NC_017154.rpt’.
    Rejecting ‘NC_017154.tab’.
    Rejecting ‘NC_017154.val’.
    Rejecting ‘NC_017155.GeneMark-2.5m’.
    Rejecting ‘NC_017155.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017155.Glimmer3’.
    Rejecting ‘NC_017155.Prodigal-2.50’.
    Rejecting ‘NC_017155.asn’.
    Rejecting ‘NC_017155.ffn’.
    Rejecting ‘NC_017155.fna’.
    Rejecting ‘NC_017155.gbk’.
    Rejecting ‘NC_017155.gbs’.
    Rejecting ‘NC_017155.gff’.
    Rejecting ‘NC_017155.ptt’.
    Rejecting ‘NC_017155.rpt’.
    Rejecting ‘NC_017155.tab’.
    Rejecting ‘NC_017155.val’.
    Rejecting ‘NC_017156.GeneMark-2.5m’.
    Rejecting ‘NC_017156.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017156.Glimmer3’.
    Rejecting ‘NC_017156.Prodigal-2.50’.
    Rejecting ‘NC_017156.asn’.
    Rejecting ‘NC_017156.ffn’.
    Rejecting ‘NC_017156.fna’.
    Rejecting ‘NC_017156.gbk’.
    Rejecting ‘NC_017156.gbs’.
    Rejecting ‘NC_017156.gff’.
    Rejecting ‘NC_017156.ptt’.
    Rejecting ‘NC_017156.rpt’.
    Rejecting ‘NC_017156.tab’.
    Rejecting ‘NC_017156.val’.
    --2020-11-10 20:19:37--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017153.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017153.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017153.faa ... done.
    Length: 22243 (22K)
    
    100%[======================================>] 22,243      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:38 (883 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017153.faa’ saved [22243]
    
    --2020-11-10 20:19:38--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017154.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017154.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017154.faa ... done.
    Length: 1597344 (1.5M)
    
    100%[======================================>] 1,597,344   3.17MB/s   in 0.5s   
    
    2020-11-10 20:19:38 (3.17 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017154.faa’ saved [1597344]
    
    --2020-11-10 20:19:38--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017155.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017155.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017155.faa ... done.
    Length: 32292 (32K)
    
    100%[======================================>] 32,292      --.-K/s   in 0.03s   
    
    2020-11-10 20:19:38 (1.13 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017155.faa’ saved [32292]
    
    --2020-11-10 20:19:38--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017156.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017156.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017156.faa ... done.
    Length: 2727 (2.7K)
    
    100%[======================================>] 2,727       --.-K/s   in 0s      
    
    2020-11-10 20:19:38 (289 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D106004_uid158071/NC_017156.faa’ saved [2727]
    
    --2020-11-10 20:19:38--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 4,554       --.-K/s   in 0.04s   
    
    2020-11-10 20:19:39 (106 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/.listing’ saved [4554]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/.listing’.
    Rejecting ‘NC_017157.GeneMark-2.5m’.
    Rejecting ‘NC_017157.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017157.Glimmer3’.
    Rejecting ‘NC_017157.Prodigal-2.50’.
    Rejecting ‘NC_017157.asn’.
    Rejecting ‘NC_017157.ffn’.
    Rejecting ‘NC_017157.fna’.
    Rejecting ‘NC_017157.gbk’.
    Rejecting ‘NC_017157.gbs’.
    Rejecting ‘NC_017157.gff’.
    Rejecting ‘NC_017157.ptt’.
    Rejecting ‘NC_017157.rpt’.
    Rejecting ‘NC_017157.tab’.
    Rejecting ‘NC_017157.val’.
    Rejecting ‘NC_017158.GeneMark-2.5m’.
    Rejecting ‘NC_017158.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017158.Glimmer3’.
    Rejecting ‘NC_017158.Prodigal-2.50’.
    Rejecting ‘NC_017158.asn’.
    Rejecting ‘NC_017158.ffn’.
    Rejecting ‘NC_017158.fna’.
    Rejecting ‘NC_017158.gbk’.
    Rejecting ‘NC_017158.gbs’.
    Rejecting ‘NC_017158.gff’.
    Rejecting ‘NC_017158.ptt’.
    Rejecting ‘NC_017158.rpt’.
    Rejecting ‘NC_017158.tab’.
    Rejecting ‘NC_017158.val’.
    Rejecting ‘NC_017159.GeneMark-2.5m’.
    Rejecting ‘NC_017159.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017159.Glimmer3’.
    Rejecting ‘NC_017159.Prodigal-2.50’.
    Rejecting ‘NC_017159.asn’.
    Rejecting ‘NC_017159.ffn’.
    Rejecting ‘NC_017159.fna’.
    Rejecting ‘NC_017159.gbk’.
    Rejecting ‘NC_017159.gbs’.
    Rejecting ‘NC_017159.gff’.
    Rejecting ‘NC_017159.ptt’.
    Rejecting ‘NC_017159.rpt’.
    Rejecting ‘NC_017159.tab’.
    Rejecting ‘NC_017159.val’.
    Rejecting ‘NC_017160.GeneMark-2.5m’.
    Rejecting ‘NC_017160.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017160.Glimmer3’.
    Rejecting ‘NC_017160.Prodigal-2.50’.
    Rejecting ‘NC_017160.asn’.
    Rejecting ‘NC_017160.ffn’.
    Rejecting ‘NC_017160.fna’.
    Rejecting ‘NC_017160.frn’.
    Rejecting ‘NC_017160.gbk’.
    Rejecting ‘NC_017160.gbs’.
    Rejecting ‘NC_017160.gff’.
    Rejecting ‘NC_017160.ptt’.
    Rejecting ‘NC_017160.rnt’.
    Rejecting ‘NC_017160.rpt’.
    Rejecting ‘NC_017160.tab’.
    Rejecting ‘NC_017160.val’.
    --2020-11-10 20:19:39--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017157.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017157.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017157.faa ... done.
    Length: 22710 (22K)
    
    100%[======================================>] 22,710      --.-K/s   in 0.01s   
    
    2020-11-10 20:19:39 (1.76 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017157.faa’ saved [22710]
    
    --2020-11-10 20:19:39--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017158.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017158.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017158.faa ... done.
    Length: 32984 (32K)
    
    100%[======================================>] 32,984      --.-K/s   in 0.03s   
    
    2020-11-10 20:19:39 (992 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017158.faa’ saved [32984]
    
    --2020-11-10 20:19:39--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017159.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017159.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017159.faa ... done.
    Length: 2672 (2.6K)
    
    100%[======================================>] 2,672       --.-K/s   in 0s      
    
    2020-11-10 20:19:39 (272 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017159.faa’ saved [2672]
    
    --2020-11-10 20:19:39--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017160.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017160.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017160.faa ... done.
    Length: 1579753 (1.5M)
    
    100%[======================================>] 1,579,753   3.26MB/s   in 0.5s   
    
    2020-11-10 20:19:40 (3.26 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_D182038_uid158073/NC_017160.faa’ saved [1579753]
    
    --2020-11-10 20:19:40--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 2,348       --.-K/s   in 0.03s   
    
    2020-11-10 20:19:40 (83.9 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/.listing’ saved [2348]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/.listing’.
    Rejecting ‘NC_004088.GeneMark-2.5m’.
    Rejecting ‘NC_004088.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_004088.Glimmer3’.
    Rejecting ‘NC_004088.Prodigal-2.50’.
    Rejecting ‘NC_004088.asn’.
    Rejecting ‘NC_004088.ffn’.
    Rejecting ‘NC_004088.fna’.
    Rejecting ‘NC_004088.frn’.
    Rejecting ‘NC_004088.gbk’.
    Rejecting ‘NC_004088.gbs’.
    Rejecting ‘NC_004088.gff’.
    Rejecting ‘NC_004088.ptt’.
    Rejecting ‘NC_004088.rnt’.
    Rejecting ‘NC_004088.rpt’.
    Rejecting ‘NC_004088.tab’.
    Rejecting ‘NC_004088.val’.
    Rejecting ‘NC_004838.GeneMark-2.5m’.
    Rejecting ‘NC_004838.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_004838.Glimmer3’.
    Rejecting ‘NC_004838.Prodigal-2.50’.
    Rejecting ‘NC_004838.asn’.
    Rejecting ‘NC_004838.ffn’.
    Rejecting ‘NC_004838.fna’.
    Rejecting ‘NC_004838.gbk’.
    Rejecting ‘NC_004838.gbs’.
    Rejecting ‘NC_004838.gff’.
    Rejecting ‘NC_004838.ptt’.
    Rejecting ‘NC_004838.rpt’.
    Rejecting ‘NC_004838.tab’.
    Rejecting ‘NC_004838.val’.
    --2020-11-10 20:19:40--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/NC_004088.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/NC_004088.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_004088.faa ... done.
    Length: 1629294 (1.6M)
    
    100%[======================================>] 1,629,294   4.68MB/s   in 0.3s   
    
    2020-11-10 20:19:40 (4.68 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/NC_004088.faa’ saved [1629294]
    
    --2020-11-10 20:19:40--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/NC_004838.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/NC_004838.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_004838.faa ... done.
    Length: 39387 (38K)
    
    100%[======================================>] 39,387      --.-K/s   in 0.03s   
    
    2020-11-10 20:19:41 (1.35 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_KIM_10_uid57875/NC_004838.faa’ saved [39387]
    
    --2020-11-10 20:19:41--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 3,451       --.-K/s   in 0.1s    
    
    2020-11-10 20:19:41 (34.0 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/.listing’ saved [3451]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/.listing’.
    Rejecting ‘NC_008118.GeneMark-2.5m’.
    Rejecting ‘NC_008118.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008118.Glimmer3’.
    Rejecting ‘NC_008118.Prodigal-2.50’.
    Rejecting ‘NC_008118.asn’.
    Rejecting ‘NC_008118.ffn’.
    Rejecting ‘NC_008118.fna’.
    Rejecting ‘NC_008118.gbk’.
    Rejecting ‘NC_008118.gbs’.
    Rejecting ‘NC_008118.gff’.
    Rejecting ‘NC_008118.ptt’.
    Rejecting ‘NC_008118.rpt’.
    Rejecting ‘NC_008118.tab’.
    Rejecting ‘NC_008118.val’.
    Rejecting ‘NC_008119.GeneMark-2.5m’.
    Rejecting ‘NC_008119.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008119.Glimmer3’.
    Rejecting ‘NC_008119.Prodigal-2.50’.
    Rejecting ‘NC_008119.asn’.
    Rejecting ‘NC_008119.ffn’.
    Rejecting ‘NC_008119.fna’.
    Rejecting ‘NC_008119.gbk’.
    Rejecting ‘NC_008119.gbs’.
    Rejecting ‘NC_008119.gff’.
    Rejecting ‘NC_008119.ptt’.
    Rejecting ‘NC_008119.rpt’.
    Rejecting ‘NC_008119.tab’.
    Rejecting ‘NC_008119.val’.
    Rejecting ‘NC_008149.GeneMark-2.5m’.
    Rejecting ‘NC_008149.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_008149.Glimmer3’.
    Rejecting ‘NC_008149.Prodigal-2.50’.
    Rejecting ‘NC_008149.asn’.
    Rejecting ‘NC_008149.ffn’.
    Rejecting ‘NC_008149.fna’.
    Rejecting ‘NC_008149.frn’.
    Rejecting ‘NC_008149.gbk’.
    Rejecting ‘NC_008149.gbs’.
    Rejecting ‘NC_008149.gff’.
    Rejecting ‘NC_008149.ptt’.
    Rejecting ‘NC_008149.rnt’.
    Rejecting ‘NC_008149.rpt’.
    Rejecting ‘NC_008149.tab’.
    Rejecting ‘NC_008149.val’.
    --2020-11-10 20:19:41--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008118.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008118.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008118.faa ... done.
    Length: 37636 (37K)
    
    100%[======================================>] 37,636      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:41 (1.45 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008118.faa’ saved [37636]
    
    --2020-11-10 20:19:41--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008119.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008119.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008119.faa ... done.
    Length: 2483 (2.4K)
    
    100%[======================================>] 2,483       --.-K/s   in 0s      
    
    2020-11-10 20:19:41 (343 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008119.faa’ saved [2483]
    
    --2020-11-10 20:19:41--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008149.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008149.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_008149.faa ... done.
    Length: 1638408 (1.6M)
    
    100%[======================================>] 1,638,408   4.74MB/s   in 0.3s   
    
    2020-11-10 20:19:42 (4.74 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Nepal516_uid58609/NC_008149.faa’ saved [1638408]
    
    --2020-11-10 20:19:42--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 3,451       --.-K/s   in 0.02s   
    
    2020-11-10 20:19:42 (168 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/.listing’ saved [3451]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/.listing’.
    Rejecting ‘NC_009377.GeneMark-2.5m’.
    Rejecting ‘NC_009377.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_009377.Glimmer3’.
    Rejecting ‘NC_009377.Prodigal-2.50’.
    Rejecting ‘NC_009377.asn’.
    Rejecting ‘NC_009377.ffn’.
    Rejecting ‘NC_009377.fna’.
    Rejecting ‘NC_009377.gbk’.
    Rejecting ‘NC_009377.gbs’.
    Rejecting ‘NC_009377.gff’.
    Rejecting ‘NC_009377.ptt’.
    Rejecting ‘NC_009377.rpt’.
    Rejecting ‘NC_009377.tab’.
    Rejecting ‘NC_009377.val’.
    Rejecting ‘NC_009378.GeneMark-2.5m’.
    Rejecting ‘NC_009378.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_009378.Glimmer3’.
    Rejecting ‘NC_009378.Prodigal-2.50’.
    Rejecting ‘NC_009378.asn’.
    Rejecting ‘NC_009378.ffn’.
    Rejecting ‘NC_009378.fna’.
    Rejecting ‘NC_009378.gbk’.
    Rejecting ‘NC_009378.gbs’.
    Rejecting ‘NC_009378.gff’.
    Rejecting ‘NC_009378.ptt’.
    Rejecting ‘NC_009378.rpt’.
    Rejecting ‘NC_009378.tab’.
    Rejecting ‘NC_009378.val’.
    Rejecting ‘NC_009381.GeneMark-2.5m’.
    Rejecting ‘NC_009381.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_009381.Glimmer3’.
    Rejecting ‘NC_009381.Prodigal-2.50’.
    Rejecting ‘NC_009381.asn’.
    Rejecting ‘NC_009381.ffn’.
    Rejecting ‘NC_009381.fna’.
    Rejecting ‘NC_009381.frn’.
    Rejecting ‘NC_009381.gbk’.
    Rejecting ‘NC_009381.gbs’.
    Rejecting ‘NC_009381.gff’.
    Rejecting ‘NC_009381.ptt’.
    Rejecting ‘NC_009381.rnt’.
    Rejecting ‘NC_009381.rpt’.
    Rejecting ‘NC_009381.tab’.
    Rejecting ‘NC_009381.val’.
    --2020-11-10 20:19:42--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009377.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009377.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_009377.faa ... done.
    Length: 26079 (25K)
    
    100%[======================================>] 26,079      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:42 (1.47 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009377.faa’ saved [26079]
    
    --2020-11-10 20:19:42--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009378.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009378.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_009378.faa ... done.
    Length: 52119 (51K)
    
    100%[======================================>] 52,119      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:42 (2.35 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009378.faa’ saved [52119]
    
    --2020-11-10 20:19:42--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009381.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009381.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_009381.faa ... done.
    Length: 1620871 (1.5M)
    
    100%[======================================>] 1,620,871   4.43MB/s   in 0.3s   
    
    2020-11-10 20:19:43 (4.43 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Pestoides_F_uid58619/NC_009381.faa’ saved [1620871]
    
    --2020-11-10 20:19:43--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 4,554       --.-K/s   in 0.1s    
    
    2020-11-10 20:19:43 (45.5 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/.listing’ saved [4554]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/.listing’.
    Rejecting ‘NC_014017.GeneMark-2.5m’.
    Rejecting ‘NC_014017.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_014017.Glimmer3’.
    Rejecting ‘NC_014017.Prodigal-2.50’.
    Rejecting ‘NC_014017.asn’.
    Rejecting ‘NC_014017.ffn’.
    Rejecting ‘NC_014017.fna’.
    Rejecting ‘NC_014017.gbk’.
    Rejecting ‘NC_014017.gbs’.
    Rejecting ‘NC_014017.gff’.
    Rejecting ‘NC_014017.ptt’.
    Rejecting ‘NC_014017.rpt’.
    Rejecting ‘NC_014017.tab’.
    Rejecting ‘NC_014017.val’.
    Rejecting ‘NC_014022.GeneMark-2.5m’.
    Rejecting ‘NC_014022.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_014022.Glimmer3’.
    Rejecting ‘NC_014022.Prodigal-2.50’.
    Rejecting ‘NC_014022.asn’.
    Rejecting ‘NC_014022.ffn’.
    Rejecting ‘NC_014022.fna’.
    Rejecting ‘NC_014022.gbk’.
    Rejecting ‘NC_014022.gbs’.
    Rejecting ‘NC_014022.gff’.
    Rejecting ‘NC_014022.ptt’.
    Rejecting ‘NC_014022.rpt’.
    Rejecting ‘NC_014022.tab’.
    Rejecting ‘NC_014022.val’.
    Rejecting ‘NC_014027.GeneMark-2.5m’.
    Rejecting ‘NC_014027.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_014027.Glimmer3’.
    Rejecting ‘NC_014027.Prodigal-2.50’.
    Rejecting ‘NC_014027.asn’.
    Rejecting ‘NC_014027.ffn’.
    Rejecting ‘NC_014027.fna’.
    Rejecting ‘NC_014027.gbk’.
    Rejecting ‘NC_014027.gbs’.
    Rejecting ‘NC_014027.gff’.
    Rejecting ‘NC_014027.ptt’.
    Rejecting ‘NC_014027.rpt’.
    Rejecting ‘NC_014027.tab’.
    Rejecting ‘NC_014027.val’.
    Rejecting ‘NC_014029.GeneMark-2.5m’.
    Rejecting ‘NC_014029.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_014029.Glimmer3’.
    Rejecting ‘NC_014029.Prodigal-2.50’.
    Rejecting ‘NC_014029.asn’.
    Rejecting ‘NC_014029.ffn’.
    Rejecting ‘NC_014029.fna’.
    Rejecting ‘NC_014029.frn’.
    Rejecting ‘NC_014029.gbk’.
    Rejecting ‘NC_014029.gbs’.
    Rejecting ‘NC_014029.gff’.
    Rejecting ‘NC_014029.ptt’.
    Rejecting ‘NC_014029.rnt’.
    Rejecting ‘NC_014029.rpt’.
    Rejecting ‘NC_014029.tab’.
    Rejecting ‘NC_014029.val’.
    --2020-11-10 20:19:43--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014017.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014017.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_014017.faa ... done.
    Length: 22313 (22K)
    
    100%[======================================>] 22,313      --.-K/s   in 0.03s   
    
    2020-11-10 20:19:43 (808 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014017.faa’ saved [22313]
    
    --2020-11-10 20:19:43--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014022.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014022.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_014022.faa ... done.
    Length: 32365 (32K)
    
    100%[======================================>] 32,365      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:43 (1.59 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014022.faa’ saved [32365]
    
    --2020-11-10 20:19:43--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014027.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014027.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_014027.faa ... done.
    Length: 2487 (2.4K)
    
    100%[======================================>] 2,487       --.-K/s   in 0s      
    
    2020-11-10 20:19:43 (254 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014027.faa’ saved [2487]
    
    --2020-11-10 20:19:43--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014029.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014029.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_014029.faa ... done.
    Length: 1569423 (1.5M)
    
    100%[======================================>] 1,569,423   6.11MB/s   in 0.2s   
    
    2020-11-10 20:19:44 (6.11 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_Z176003_uid47317/NC_014029.faa’ saved [1569423]
    
    --2020-11-10 20:19:44--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 4,696       --.-K/s   in 0.1s    
    
    2020-11-10 20:19:44 (43.9 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/.listing’ saved [4696]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/.listing’.
    Rejecting ‘NC_017263.GeneMark-2.5m’.
    Rejecting ‘NC_017263.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017263.Glimmer3’.
    Rejecting ‘NC_017263.Prodigal-2.50’.
    Rejecting ‘NC_017263.asn’.
    Rejecting ‘NC_017263.ffn’.
    Rejecting ‘NC_017263.fna’.
    Rejecting ‘NC_017263.frn’.
    Rejecting ‘NC_017263.gbk’.
    Rejecting ‘NC_017263.gbs’.
    Rejecting ‘NC_017263.gff’.
    Rejecting ‘NC_017263.ptt’.
    Rejecting ‘NC_017263.rnt’.
    Rejecting ‘NC_017263.rpt’.
    Rejecting ‘NC_017263.tab’.
    Rejecting ‘NC_017263.val’.
    Rejecting ‘NC_017264.GeneMark-2.5m’.
    Rejecting ‘NC_017264.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017264.Glimmer3’.
    Rejecting ‘NC_017264.Prodigal-2.50’.
    Rejecting ‘NC_017264.asn’.
    Rejecting ‘NC_017264.ffn’.
    Rejecting ‘NC_017264.fna’.
    Rejecting ‘NC_017264.gbk’.
    Rejecting ‘NC_017264.gbs’.
    Rejecting ‘NC_017264.gff’.
    Rejecting ‘NC_017264.ptt’.
    Rejecting ‘NC_017264.rpt’.
    Rejecting ‘NC_017264.tab’.
    Rejecting ‘NC_017264.val’.
    Rejecting ‘NC_017265.GeneMark-2.5m’.
    Rejecting ‘NC_017265.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017265.Glimmer3’.
    Rejecting ‘NC_017265.Prodigal-2.50’.
    Rejecting ‘NC_017265.asn’.
    Rejecting ‘NC_017265.ffn’.
    Rejecting ‘NC_017265.fna’.
    Rejecting ‘NC_017265.frn’.
    Rejecting ‘NC_017265.gbk’.
    Rejecting ‘NC_017265.gbs’.
    Rejecting ‘NC_017265.gff’.
    Rejecting ‘NC_017265.ptt’.
    Rejecting ‘NC_017265.rnt’.
    Rejecting ‘NC_017265.rpt’.
    Rejecting ‘NC_017265.tab’.
    Rejecting ‘NC_017265.val’.
    Rejecting ‘NC_017266.GeneMark-2.5m’.
    Rejecting ‘NC_017266.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_017266.Glimmer3’.
    Rejecting ‘NC_017266.Prodigal-2.50’.
    Rejecting ‘NC_017266.asn’.
    Rejecting ‘NC_017266.ffn’.
    Rejecting ‘NC_017266.fna’.
    Rejecting ‘NC_017266.gbk’.
    Rejecting ‘NC_017266.gbs’.
    Rejecting ‘NC_017266.gff’.
    Rejecting ‘NC_017266.ptt’.
    Rejecting ‘NC_017266.rpt’.
    Rejecting ‘NC_017266.tab’.
    Rejecting ‘NC_017266.val’.
    --2020-11-10 20:19:44--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017263.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017263.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017263.faa ... done.
    Length: 14891 (15K)
    
    100%[======================================>] 14,891      --.-K/s   in 0s      
    
    2020-11-10 20:19:44 (56.3 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017263.faa’ saved [14891]
    
    --2020-11-10 20:19:44--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017264.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017264.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017264.faa ... done.
    Length: 3267 (3.2K)
    
    100%[======================================>] 3,267       --.-K/s   in 0s      
    
    2020-11-10 20:19:44 (362 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017264.faa’ saved [3267]
    
    --2020-11-10 20:19:44--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017265.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017265.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017265.faa ... done.
    Length: 1738270 (1.7M)
    
    100%[======================================>] 1,738,270   7.26MB/s   in 0.2s   
    
    2020-11-10 20:19:45 (7.26 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017265.faa’ saved [1738270]
    
    --2020-11-10 20:19:45--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017266.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017266.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_017266.faa ... done.
    Length: 42568 (42K)
    
    100%[======================================>] 42,568      --.-K/s   in 0.04s   
    
    2020-11-10 20:19:45 (1001 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017266.faa’ saved [42568]
    
    --2020-11-10 20:19:45--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/.listing’
    ==> CWD (1) /genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037 ... done.
    ==> PASV ... done.    ==> LIST ... done.
    
        [ <=>                                   ] 5,799       --.-K/s   in 0.08s   
    
    2020-11-10 20:19:45 (75.5 KB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/.listing’ saved [5799]
    
    Removed ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/.listing’.
    Rejecting ‘NC_005810.GeneMark-2.5m’.
    Rejecting ‘NC_005810.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_005810.Glimmer3’.
    Rejecting ‘NC_005810.Prodigal-2.50’.
    Rejecting ‘NC_005810.asn’.
    Rejecting ‘NC_005810.ffn’.
    Rejecting ‘NC_005810.fna’.
    Rejecting ‘NC_005810.frn’.
    Rejecting ‘NC_005810.gbk’.
    Rejecting ‘NC_005810.gbs’.
    Rejecting ‘NC_005810.gff’.
    Rejecting ‘NC_005810.ptt’.
    Rejecting ‘NC_005810.rnt’.
    Rejecting ‘NC_005810.rpt’.
    Rejecting ‘NC_005810.tab’.
    Rejecting ‘NC_005810.val’.
    Rejecting ‘NC_005813.GeneMark-2.5m’.
    Rejecting ‘NC_005813.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_005813.Glimmer3’.
    Rejecting ‘NC_005813.Prodigal-2.50’.
    Rejecting ‘NC_005813.asn’.
    Rejecting ‘NC_005813.ffn’.
    Rejecting ‘NC_005813.fna’.
    Rejecting ‘NC_005813.frn’.
    Rejecting ‘NC_005813.gbk’.
    Rejecting ‘NC_005813.gbs’.
    Rejecting ‘NC_005813.gff’.
    Rejecting ‘NC_005813.ptt’.
    Rejecting ‘NC_005813.rnt’.
    Rejecting ‘NC_005813.rpt’.
    Rejecting ‘NC_005813.tab’.
    Rejecting ‘NC_005813.val’.
    Rejecting ‘NC_005814.GeneMark-2.5m’.
    Rejecting ‘NC_005814.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_005814.Glimmer3’.
    Rejecting ‘NC_005814.Prodigal-2.50’.
    Rejecting ‘NC_005814.asn’.
    Rejecting ‘NC_005814.ffn’.
    Rejecting ‘NC_005814.fna’.
    Rejecting ‘NC_005814.gbk’.
    Rejecting ‘NC_005814.gbs’.
    Rejecting ‘NC_005814.gff’.
    Rejecting ‘NC_005814.ptt’.
    Rejecting ‘NC_005814.rpt’.
    Rejecting ‘NC_005814.tab’.
    Rejecting ‘NC_005814.val’.
    Rejecting ‘NC_005815.GeneMark-2.5m’.
    Rejecting ‘NC_005815.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_005815.Glimmer3’.
    Rejecting ‘NC_005815.Prodigal-2.50’.
    Rejecting ‘NC_005815.asn’.
    Rejecting ‘NC_005815.ffn’.
    Rejecting ‘NC_005815.fna’.
    Rejecting ‘NC_005815.gbk’.
    Rejecting ‘NC_005815.gbs’.
    Rejecting ‘NC_005815.gff’.
    Rejecting ‘NC_005815.ptt’.
    Rejecting ‘NC_005815.rpt’.
    Rejecting ‘NC_005815.tab’.
    Rejecting ‘NC_005815.val’.
    Rejecting ‘NC_005816.GeneMark-2.5m’.
    Rejecting ‘NC_005816.GeneMarkHMM-2.6r’.
    Rejecting ‘NC_005816.Glimmer3’.
    Rejecting ‘NC_005816.Prodigal-2.50’.
    Rejecting ‘NC_005816.asn’.
    Rejecting ‘NC_005816.ffn’.
    Rejecting ‘NC_005816.fna’.
    Rejecting ‘NC_005816.gbk’.
    Rejecting ‘NC_005816.gbs’.
    Rejecting ‘NC_005816.gff’.
    Rejecting ‘NC_005816.ptt’.
    Rejecting ‘NC_005816.rpt’.
    Rejecting ‘NC_005816.tab’.
    Rejecting ‘NC_005816.val’.
    --2020-11-10 20:19:45--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005810.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005810.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_005810.faa ... done.
    Length: 1675446 (1.6M)
    
    100%[======================================>] 1,675,446   6.64MB/s   in 0.2s   
    
    2020-11-10 20:19:45 (6.64 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005810.faa’ saved [1675446]
    
    --2020-11-10 20:19:45--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005813.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005813.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_005813.faa ... done.
    Length: 27143 (27K)
    
    100%[======================================>] 27,143      --.-K/s   in 0.02s   
    
    2020-11-10 20:19:45 (1.18 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005813.faa’ saved [27143]
    
    --2020-11-10 20:19:45--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005814.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005814.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_005814.faa ... done.
    Length: 9798 (9.6K)
    
    100%[======================================>] 9,798       --.-K/s   in 0s      
    
    2020-11-10 20:19:45 (30.1 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005814.faa’ saved [9798]
    
    --2020-11-10 20:19:45--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005815.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005815.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_005815.faa ... done.
    Length: 43619 (43K)
    
    100%[======================================>] 43,619      --.-K/s   in 0.04s   
    
    2020-11-10 20:19:46 (1.06 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005815.faa’ saved [43619]
    
    --2020-11-10 20:19:46--  ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005816.faa
               => ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005816.faa’
    ==> CWD not required.
    ==> PASV ... done.    ==> RETR NC_005816.faa ... done.
    Length: 2981 (2.9K)
    
    100%[======================================>] 2,981       --.-K/s   in 0s      
    
    2020-11-10 20:19:46 (360 MB/s) - ‘ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005816.faa’ saved [2981]
    
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_pseudotuberculosis_IP_31758_uid58487’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_pseudotuberculosis_IP_32953_uid58157’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_pseudotuberculosis_PB1__uid59153’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Yersinia_pseudotuberculosis_YPIII_uid59151’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zobellia_galactanivorans_uid70621’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zunongwangia_profunda_SM_A87_uid48073’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zymomonas_mobilis_ATCC_10988_uid55403’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zymomonas_mobilis_ATCC_29191_uid170612’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zymomonas_mobilis_CP4___NRRL_B_14023_uid229874’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zymomonas_mobilis_NCIMB_11163_uid41019’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zymomonas_mobilis_ZM4_uid58095’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/Zymomonas_mobilis_pomaceae_ATCC_29192_uid68445’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/_Cellvibrio__gilvus_ATCC_13127_uid68143’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/_Clostridium__sticklandii_uid59585’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/_Nostoc_azollae__0708_uid49725’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/_Ruminococcus__obeum_uid197165’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/_Ruminococcus__torques_uid197166’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/alpha_proteobacterium_HIMB59_uid175778’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/alpha_proteobacterium_HIMB5_uid175779’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/archaeon_Mx1201_uid196597’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/bacterium_BT_1_uid184079’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/beta_proteobacterium_CB_uid191340’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/butyrate_producing_bacterium_SM4_1_uid197180’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/butyrate_producing_bacterium_SS3_4_uid197159’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/butyrate_producing_bacterium_SSC_2_uid197181’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/candidate_division_SR1_bacterium_RAAC1_SR1_1_uid230714’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/candidate_division_WWE3_bacterium_RAAC2_WWE3_1_uid230713’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/cyanobacterium_UCYN_A_uid43697’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/delta_proteobacterium_BABL1_uid230716’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/gamma_proteobacterium_HdN1_uid51635’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/halophilic_archaeon_DL31_uid72619’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/multiisoloate_uid216090’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/multispecies_uid212977’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/secondary_endosymbiont_of_Ctenarytaina_eucalypti_uid172737’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/secondary_endosymbiont_of_Heteropsylla_cubana_Thao2000_uid172738’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/syncytium_symbiont_of_Diaphorina_citri_uid213384’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/uncultured_Sulfuricurvum_RIFRC_1_uid193658’ as it is excluded/not-included.
    Not descending to ‘genomes/archive/old_refseq/Bacteria/uncultured_Termite_group_1_bacterium_phylotype_Rs_D17_uid59059’ as it is excluded/not-included.
    FINISHED --2020-11-10 20:19:46--
    Total wall clock time: 17s
    Downloaded: 43 files, 19M in 6.1s (3.15 MB/s)



```bash
pwd
```

    /media/sf_Gelare/scratch/linux_data/problem2/ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria



```bash

ls
```

    [0m[38;5;27mYersinia_pestis_A1122_uid158119[0m
    [38;5;27mYersinia_pestis_Angola_uid58485[0m
    [38;5;27mYersinia_pestis_Antiqua_uid58607[0m
    [38;5;27mYersinia_pestis_biovar_Medievalis_Harbin_35_uid158537[0m
    [38;5;27mYersinia_pestis_biovar_Microtus_91001_uid58037[0m
    [38;5;27mYersinia_pestis_CO92_uid57621[0m
    [38;5;27mYersinia_pestis_D106004_uid158071[0m
    [38;5;27mYersinia_pestis_D182038_uid158073[0m
    [38;5;27mYersinia_pestis_KIM_10_uid57875[0m
    [38;5;27mYersinia_pestis_Nepal516_uid58609[0m
    [38;5;27mYersinia_pestis_Pestoides_F_uid58619[0m
    [38;5;27mYersinia_pestis_Z176003_uid47317[0m


## Problem 3
Starting from last directory write a single bash command line to count the total number of proteins in all
the Yersinia pestis strains together. You may chain as many commands as you wish.


```bash
cd /media/sf_Gelare/scratch/linux_data/problem2/ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria
```


```bash
pwd
```

    /media/sf_Gelare/scratch/linux_data/problem2/ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria



```bash
ls
```

    [0m[38;5;27mYersinia_pestis_A1122_uid158119[0m
    [38;5;27mYersinia_pestis_Angola_uid58485[0m
    [38;5;27mYersinia_pestis_Antiqua_uid58607[0m
    [38;5;27mYersinia_pestis_biovar_Medievalis_Harbin_35_uid158537[0m
    [38;5;27mYersinia_pestis_biovar_Microtus_91001_uid58037[0m
    [38;5;27mYersinia_pestis_CO92_uid57621[0m
    [38;5;27mYersinia_pestis_D106004_uid158071[0m
    [38;5;27mYersinia_pestis_D182038_uid158073[0m
    [38;5;27mYersinia_pestis_KIM_10_uid57875[0m
    [38;5;27mYersinia_pestis_Nepal516_uid58609[0m
    [38;5;27mYersinia_pestis_Pestoides_F_uid58619[0m
    [38;5;27mYersinia_pestis_Z176003_uid47317[0m



```bash
find -name "*.faa" -print
```

    ./Yersinia_pestis_Antiqua_uid58607/NC_008122.faa
    ./Yersinia_pestis_Antiqua_uid58607/NC_008121.faa
    ./Yersinia_pestis_Antiqua_uid58607/NC_008120.faa
    ./Yersinia_pestis_Antiqua_uid58607/NC_008150.faa
    ./Yersinia_pestis_D182038_uid158073/NC_017157.faa
    ./Yersinia_pestis_D182038_uid158073/NC_017160.faa
    ./Yersinia_pestis_D182038_uid158073/NC_017158.faa
    ./Yersinia_pestis_D182038_uid158073/NC_017159.faa
    ./Yersinia_pestis_D106004_uid158071/NC_017156.faa
    ./Yersinia_pestis_D106004_uid158071/NC_017154.faa
    ./Yersinia_pestis_D106004_uid158071/NC_017155.faa
    ./Yersinia_pestis_D106004_uid158071/NC_017153.faa
    ./Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005816.faa
    ./Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005815.faa
    ./Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005814.faa
    ./Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005810.faa
    ./Yersinia_pestis_biovar_Microtus_91001_uid58037/NC_005813.faa
    ./Yersinia_pestis_Pestoides_F_uid58619/NC_009381.faa
    ./Yersinia_pestis_Pestoides_F_uid58619/NC_009378.faa
    ./Yersinia_pestis_Pestoides_F_uid58619/NC_009377.faa
    ./Yersinia_pestis_A1122_uid158119/NC_017168.faa
    ./Yersinia_pestis_A1122_uid158119/NC_017169.faa
    ./Yersinia_pestis_A1122_uid158119/NC_017170.faa
    ./Yersinia_pestis_Angola_uid58485/NC_010158.faa
    ./Yersinia_pestis_Angola_uid58485/NC_010159.faa
    ./Yersinia_pestis_Angola_uid58485/NC_010157.faa
    ./Yersinia_pestis_Nepal516_uid58609/NC_008149.faa
    ./Yersinia_pestis_Nepal516_uid58609/NC_008118.faa
    ./Yersinia_pestis_Nepal516_uid58609/NC_008119.faa
    ./Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017263.faa
    ./Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017265.faa
    ./Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017264.faa
    ./Yersinia_pestis_biovar_Medievalis_Harbin_35_uid158537/NC_017266.faa
    ./Yersinia_pestis_KIM_10_uid57875/NC_004088.faa
    ./Yersinia_pestis_KIM_10_uid57875/NC_004838.faa
    ./Yersinia_pestis_CO92_uid57621/NC_003143.faa
    ./Yersinia_pestis_CO92_uid57621/NC_003134.faa
    ./Yersinia_pestis_CO92_uid57621/NC_003131.faa
    ./Yersinia_pestis_CO92_uid57621/NC_003132.faa
    ./Yersinia_pestis_Z176003_uid47317/NC_014017.faa
    ./Yersinia_pestis_Z176003_uid47317/NC_014029.faa
    ./Yersinia_pestis_Z176003_uid47317/NC_014027.faa
    ./Yersinia_pestis_Z176003_uid47317/NC_014022.faa



```bash
find -name "*.faa" -exec grep ">" {} + | wc -l
```

    48772


 There are 48772 proteins in all the Yersinia pestis strains together

## Problem 4a
E. coli MG1655 is the standard referece strain of E. coli. The protein FASTA file for this strain can be downloaded from ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa. (a) Using just bash commands can you find out what isthe average length of protein in this strain? You may use as many commands as you may wish. 


```bash
pwd
```

    /media/sf_Gelare/scratch/linux_data/problem4


used the following command line to download the file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa


```bash
ls
```

    [0m[38;5;34mNC_000913.faa[0m


to answer this question, determine the number of amino acids in the entire MG1655 genome and divide it by the number of proteins in MG1655

first, I will determine the number of different proteins using:


```bash
cat NC_000913.faa | grep "^>" | wc -l
```

    4140


next, determine the number of amino acids using the command below. Note, that we only include lines that do not start with ">", and remove the returns from the character count.


```bash
cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c
```

    1311795


to find average length of protein in units of amino acids, divide number of amino acids by number of protein sequences using


```bash
echo $(cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c)/$(cat NC_000913.faa | grep "^>" | wc -l) | bc
```

    316


## Problem 4b
(b) In the second part of the problem, write your commmands in a bash script such a way that given any fasta file as
the option to the script, it can print out the average length of protein in the file.


```bash
echo $(cat *.faa | grep -v "^>" | tr -d "\n" | wc -c)/$(cat *.faa | grep "^>" | wc -l) | bc
```

I think the method above would only work if you were in a directory that contained your desired fasta file. Alternatively, you could set the file name as a variable. 

save the following as a script in text editor (saved as 'problem4b'):
echo $(cat $1 | grep -v "^>" | tr -d "\n" | wc -c)/$(cat $1 | grep "^>" | wc -l) | bc


```bash

pwd
```

    /media/sf_Gelare/scratch/linux_data/problem4



```bash
bash problem4b NC_000913.faa
```

    316

