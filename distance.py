import csv
import argparse

parser = argparse.ArgumentParser(description='Read a VSC file with addresses')
parser.add_argument('filename', type=str, help='The name of the file to read')
args = parser.parse_args()

def get_distance(distance_mm):
    # Define the distances in millimeters
    km = 1e6
    earth_moon = 384400e6
    earth_sun = 147.24e12
    light_year = 9.461e18

    # Determine the most appropriate unit
    if distance_mm < km:
        return f"{distance_mm:.3f} mm"
    elif distance_mm < earth_moon:
        return f"{distance_mm / km:.3f} km"
    elif distance_mm < earth_sun:
        return f"{distance_mm / earth_moon:.3f} times Earth-Moon distance"
    elif distance_mm < light_year:
        return f"{distance_mm / earth_sun:.3f} times Earth-Sun distance"
    else:
        return f"{distance_mm / light_year:.3f} light years"

max_hex = '0xffffffffffffffff'
max_value = int(max_hex,16)

with open(args.filename, 'r') as file:
    reader = csv.reader(file, delimiter=',')
    for row in reader:
        int_value = int(row[0], 16)
        print(f"{row[2].strip()}({row[1].strip()}) equals {get_distance(int_value)}")
    print(f"End of address space({max_hex}) is {get_distance(max_value)}")
