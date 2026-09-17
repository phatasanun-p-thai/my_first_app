import 'package:flutter/material.dart';

import 'data/resume_data.dart';
import 'theme.dart';

const _maxWidth = 1060.0;

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = resumeData;
    return Scaffold(
      backgroundColor: ResumeColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroHeader(data: data),
                const SizedBox(height: 24),
                _SectionCard(
                  icon: Icons.person_outline,
                  title: 'เกี่ยวกับฉัน',
                  child: Text(
                    data.about,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.75,
                      color: ResumeColors.textSecondary,
                    ),
                  ),
                ),
                if (data.strengths.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.auto_awesome_outlined,
                    title: 'จุดเด่น',
                    child: _IconBulletList(
                      items: data.strengths,
                      icon: Icons.check_circle,
                      iconColor: ResumeColors.accent,
                    ),
                  ),
                ],
                if (data.education.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.school_outlined,
                    title: 'ประวัติการศึกษา',
                    child: _EducationTimeline(items: data.education),
                  ),
                ],
                if (data.skills.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.bolt_outlined,
                    title: 'ทักษะและความสามารถ',
                    child: _SkillGroups(skills: data.skills),
                  ),
                ],
                if (data.experience.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.business_center_outlined,
                    title: 'ประวัติการทำงาน',
                    child: Column(
                      children: [
                        for (final exp in data.experience)
                          _ExperienceCard(exp: exp),
                      ],
                    ),
                  ),
                ],
                if (data.projects.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.code_outlined,
                    title: 'โครงงาน',
                    child: _ProjectCard(project: data.projects.first),
                  ),
                ],
                if (data.certificates.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.workspace_premium_outlined,
                    title: 'ใบรับรองและการฝึกอบรม',
                    child: Column(
                      children: [
                        for (final (index, cert)
                            in data.certificates.indexed) ...[
                          _CertificateCard(cert: cert),
                          if (index != data.certificates.length - 1)
                            const Divider(
                              height: 24,
                              color: ResumeColors.border,
                            ),
                        ],
                      ],
                    ),
                  ),
                ],
                if (data.languages.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.language_outlined,
                    title: 'ทักษะทางภาษา',
                    child: _SkillGroups(skills: data.languages),
                  ),
                ],
                if (data.workEthics.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _SectionCard(
                    icon: Icons.military_tech_outlined,
                    title: 'จรรยาบรรณและความพร้อมในการทำงาน',
                    child: _IconBulletList(
                      items: data.workEthics,
                      icon: Icons.circle,
                      iconColor: ResumeColors.accentSoft2,
                    ),
                  ),
                ],
                const SizedBox(height: 36),
                const _Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({required this.data});

  final ResumeData data;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 720;

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name,
          style: TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w700,
            fontSize: isWide ? 30 : 23,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.title,
          style: const TextStyle(
            fontFamily: 'Sora',
            fontSize: 15.5,
            fontWeight: FontWeight.w600,
            color: ResumeColors.heroAccentText,
          ),
        ),
        if (data.tagline.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            data.tagline,
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.white.withValues(alpha: 0.75),
            ),
          ),
        ],
        const SizedBox(height: 22),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _HeroChip(icon: Icons.email_outlined, label: data.contact.email),
            _HeroChip(icon: Icons.phone_outlined, label: data.contact.phone),
            _HeroChip(
              icon: Icons.location_on_outlined,
              label: data.contact.location,
            ),
          ],
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(isWide ? 34 : 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ResumeColors.heroPrimary, ResumeColors.heroSecondary],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ResumeColors.accent.withValues(alpha: 0.28),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: info),
          if (data.photo != null) ...[
            SizedBox(width: isWide ? 30 : 16),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.asset(
                  data.photo!,
                  width: isWide ? 150 : 110,
                  height: isWide ? 180 : 132,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  const _HeroChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15.5, color: Colors.white),
          const SizedBox(width: 7),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: ResumeColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ResumeColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ResumeColors.accentSoft,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 19, color: ResumeColors.accent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: ResumeColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ?child,
        ],
      ),
    );
  }
}

class _EducationTimeline extends StatelessWidget {
  const _EducationTimeline({required this.items});

  final List<Education> items;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10,
          top: 6,
          bottom: 6,
          child: Container(
            width: 2,
            color: ResumeColors.border,
          ),
        ),
        Column(
          children: [
            for (final (index, edu) in items.indexed)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 22,
                    child: Column(
                      children: [
                        Container(
                          width: 17,
                          height: 17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ResumeColors.surface,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 11,
                            height: 11,
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                              color: ResumeColors.accent,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ResumeColors.accent.withValues(alpha: 0.4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 18),
                      padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: ResumeColors.surfaceLight,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: ResumeColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                edu.degree,
                                style: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                edu.school,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                  color: ResumeColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (edu.field.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            edu.field,
                            style: const TextStyle(
                              fontSize: 13.5,
                              height: 1.5,
                              color: ResumeColors.textSecondary,
                            ),
                          ),
                        ],
                        if (edu.period.isNotEmpty || edu.gpa != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              if (edu.period.isNotEmpty)
                                Text(
                                  edu.period,
                                  style: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color: ResumeColors.accent,
                                  ),
                                ),
                              if (edu.period.isNotEmpty && edu.gpa != null)
                                const SizedBox(width: 12),
                              if (edu.gpa != null)
                                Text(
                                  'GPA ${edu.gpa}',
                                  style: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color: ResumeColors.textSecondary,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _SkillGroups extends StatelessWidget {
  const _SkillGroups({required this.skills});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    final byCategory = <String, List<Skill>>{};
    for (final skill in skills) {
      byCategory.putIfAbsent(skill.category, () => []).add(skill);
    }
    return Column(
      children: [
        for (final entry in byCategory.entries) ...[
          Text(
            entry.key,
            style: const TextStyle(
              fontFamily: 'Sora',
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: ResumeColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          for (final skill in entry.value) _SkillBar(skill: skill),
          if (entry.key != byCategory.keys.last) const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _SkillBar extends StatelessWidget {
  const _SkillBar({required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ResumeColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${skill.level}%',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: ResumeColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: skill.level / 100,
              minHeight: 8,
              backgroundColor: ResumeColors.accentSoft2,
              valueColor: const AlwaysStoppedAnimation(ResumeColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.name,
          style: const TextStyle(
            fontFamily: 'Sora',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.description,
          style: const TextStyle(
            fontSize: 14,
            height: 1.65,
            color: ResumeColors.textSecondary,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final tech in project.tech)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 5.5),
                decoration: BoxDecoration(
                  color: ResumeColors.accentSoft,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  tech,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: ResumeColors.accent,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _CertificateCard extends StatelessWidget {
  const _CertificateCard({required this.cert});

  final Certificate cert;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ResumeColors.accentSoft,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.workspace_premium_outlined,
            size: 18,
            color: ResumeColors.accent,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cert.name,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                cert.description,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: ResumeColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconBulletList extends StatelessWidget {
  const _IconBulletList({
    required this.items,
    required this.icon,
    required this.iconColor,
  });

  final List<String> items;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(icon, size: 15, color: iconColor),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.55,
                      color: ResumeColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.exp});

  final Experience exp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.role,
                    style: const TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 15.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    exp.company,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: ResumeColors.accent,
                    ),
                  ),
                ],
              ),
            ),
            if (exp.period.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: ResumeColors.accentSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  exp.period,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: ResumeColors.accent,
                  ),
                ),
              ),
          ],
        ),
        if (exp.responsibilities.isNotEmpty) ...[
          const SizedBox(height: 12),
          for (final item in exp.responsibilities)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: ResumeColors.accent,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.55,
                        color: ResumeColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'สร้างด้วย Flutter · แก้ไขข้อมูลได้ที่ lib/data/resume_data.dart',
        style: const TextStyle(
          fontSize: 12,
          color: ResumeColors.textSecondary,
        ),
      ),
    );
  }
}