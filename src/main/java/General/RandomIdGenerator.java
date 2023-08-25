package General;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public abstract class RandomIdGenerator {
    public static int generateRandomId(List<Integer> existingIds) {
        Set<Integer> idSet = new HashSet<>(existingIds);

        Random random = new Random();
        int randomId;

        do {
            randomId = random.nextInt(Integer.MAX_VALUE);
        } while (idSet.contains(randomId));

        return randomId;
    }
}