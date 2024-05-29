import os
import numpy as np
from tqdm import tqdm

def lut_to_hex(lut_filename, hex_filename, pbar, file, start_address):
    # Lire la LUT à partir du fichier .txt
    lut = np.loadtxt(lut_filename, dtype=int).reshape(-1, 3)

    # Calculer la taille en mémoire de la LUT
    lut_size = lut.size  // 3  # 1 octet par valeur RGB

    print(f"Memory size for {hex_filename}: {lut_size} bytes")

    # Générer le code HEX pour la LUT
    for i in range(0, len(lut), 16):  # Process 16 data bytes at a time
        # Accumuler chaque valeur RGB dans la chaîne hex_values
        hex_values = ''
        for j in range(i, min(i + 16, len(lut))):
            r, g, b = lut[j]
            for color in [r, g, b]:
                hex_values += f'{color:02X}'
                pbar.update()  # Update the progress bar

        # Calculer le nombre d'octets de données (BB)
        byte_count = len(hex_values) // 2

        # Convertir l'adresse de début en hexadécimal (AAAA)
        address = format(start_address + i // 16, '04X')

        # Définir le type de champ (TT) comme '00' pour les données
        record_type = '00'

        # Calculer le checksum (CC)
        checksum = (-(byte_count + int(address, 16) + int(record_type, 16) + sum([int(hex_values[i:i+2], 16) for i in range(0, len(hex_values), 2)]))) & 0xFF

        # Écrire la ligne dans le fichier hexadécimal
        file.write(f':{byte_count:02X}{address}{record_type}{hex_values}{checksum:02X}\n')

    # Écrire la ligne de fin de fichier
    file.write(':00000001FF\n')

    # Retourner la taille de la LUT pour l'ajouter à la taille totale
    return lut_size

def write_lut_info(lut_info, start_address, end_address, lut_size, file):
    file.write(f"LUT Name: {lut_info['lut_name']}\n")
    file.write(f"Inverse: {'Yes' if lut_info['inverse'] else 'No'}\n")
    file.write(f"Start Address: {start_address:08X}\n")
    file.write(f"End Address: {end_address:08X}\n")
    file.write(f"LUT Size: {lut_size} bytes\n")
    file.write("\n")
    
# Liste des LUT à traiter
lut_list = [
    {"folder_path": "ReinhardLUTs\\", "lut_name": "reinhard", "inverse": False, "to_save": True},
    {"folder_path": "ReinhardLUTs\\", "lut_name": "reinhard", "inverse": True, "to_save": True},
    {"folder_path": "Uncharted2filmicLUTs\\", "lut_name": "Uncharted2filmic", "inverse": False, "to_save": False},
    {"folder_path": "Uncharted2filmicLUTs\\", "lut_name": "Uncharted2filmic", "inverse": True, "to_save": False},
    {"folder_path": "BakingLabACESLUTs\\", "lut_name": "BakingLabACES", "inverse": False, "to_save": False},
    {"folder_path": "BakingLabACESLUTs\\", "lut_name": "BakingLabACES", "inverse": True, "to_save": False},
    {"folder_path": "NarkowiczACESLUTs\\", "lut_name": "NarkowiczACES", "inverse": False, "to_save": False},
    {"folder_path": "NarkowiczACESLUTs\\", "lut_name": "NarkowiczACES", "inverse": True, "to_save": False}
]

# Traitement de chaque LUT
LUT_SIZE = 64
script_dir = os.path.dirname(os.path.abspath(__file__))
total_size = 0
hex_filename = "all_luts.hex"
info_filename = "all_luts_info.txt"
with open(os.path.join(script_dir, "LUT_HEX\\", hex_filename), 'w') as hex_file, \
     open(os.path.join(script_dir, "LUT_HEX\\", info_filename), 'w') as info_file:
    with tqdm(total=len(lut_list), desc="Processing LUTs") as pbar:
        address = 0x800000  # Set the start address to the middle of a 64MB bank
        for lut_info in lut_list:
            # Si la LUT n'est pas marquée pour être sauvegardée, passer à la suivante
            if not lut_info.get("to_save", False):
                continue

            # Générer le nom du fichier en fonction de si la LUT est inversée ou non
            lut_filename = f"{lut_info['lut_name']}_lut_int_{LUT_SIZE}.txt" if not lut_info["inverse"] else f"inverse_{lut_info['lut_name']}_lut_int_{LUT_SIZE}.txt"
            lut_size = lut_to_hex(
                os.path.join(script_dir, lut_info["folder_path"], lut_filename),
                hex_filename,
                tqdm(total=1048576, desc=f"Processing {hex_filename}"),  # Create a new progress bar for each .hex file
                hex_file,
                address
            )
            write_lut_info(lut_info, address, address + lut_size - 1, lut_size, info_file)
            address += lut_size
            total_size += lut_size
            pbar.update()

print(f"Total memory size: {total_size} bytes")